Require Import Clightdefs.

Local Open Scope Z_scope.

Definition _hmac : ident := 85%positive.
Definition _sep_value : ident := 110%positive.
Definition _use_len : ident := 130%positive.
Definition _mbedtls_hmac_drbg_update : ident := 111%positive.
Definition _num : ident := 22%positive.
Definition _V : ident := 12%positive.
Definition _left : ident := 128%positive.
Definition _sep : ident := 108%positive.
Definition ___builtin_fmsub : ident := 63%positive.
Definition _hmac_ctx : ident := 10%positive.
Definition ___i64_utod : ident := 44%positive.
Definition ___builtin_negl : ident := 3%positive.
Definition ___builtin_write16_reversed : ident := 1%positive.
Definition _interval : ident := 124%positive.
Definition _key : ident := 88%positive.
Definition _md_size : ident := 119%positive.
Definition _mbedtls_md_info_from_type : ident := 79%positive.
Definition _HMAC_Init : ident := 72%positive.
Definition _K : ident := 109%positive.
Definition _md_type : ident := 78%positive.
Definition _malloc : ident := 68%positive.
Definition ___builtin_fabs : ident := 28%positive.
Definition _mbedtls_hmac_drbg_seed_buf : ident := 113%positive.
Definition _mbedtls_zeroize : ident := 102%positive.
Definition _mbedtls_md_info_t : ident := 7%positive.
Definition _mbedtls_hmac_drbg_init : ident := 103%positive.
Definition _p : ident := 101%positive.
Definition _keylen : ident := 89%positive.
Definition ___i64_stof : ident := 45%positive.
Definition _dummy : ident := 27%positive.
Definition _ctx : ident := 84%positive.
Definition _ret : ident := 82%positive.
Definition _o_ctx : ident := 25%positive.
Definition _prediction_resistance : ident := 15%positive.
Definition ___builtin_fmax : ident := 60%positive.
Definition _out : ident := 129%positive.
Definition _len : ident := 114%positive.
Definition ___builtin_membar : ident := 32%positive.
Definition _mbedtls_hmac_drbg_reseed : ident := 117%positive.
Definition _memcpy : ident := 70%positive.
Definition _mbedtls_md_hmac_finish : ident := 96%positive.
Definition _mbedtls_hmac_drbg_context : ident := 17%positive.
Definition _md_info : ident := 8%positive.
Definition _out_len : ident := 127%positive.
Definition ___i64_stod : ident := 43%positive.
Definition ___i64_sar : ident := 53%positive.
Definition ___i64_sdiv : ident := 47%positive.
Definition _mbedtls_md_hmac_reset : ident := 91%positive.
Definition ___builtin_va_end : ident := 36%positive.
Definition _get_entropy : ident := 98%positive.
Definition _Nl : ident := 19%positive.
Definition ___builtin_fmin : ident := 61%positive.
Definition _mbedtls_md_free : ident := 97%positive.
Definition _mbedtls_hmac_drbg_set_prediction_resistance : ident := 122%positive.
Definition ___compcert_va_int32 : ident := 37%positive.
Definition _mbedtls_hmac_drbg_free : ident := 133%positive.
Definition ___i64_dtou : ident := 42%positive.
Definition _mbedtls_hmac_drbg_random : ident := 132%positive.
Definition _memset : ident := 71%positive.
Definition _mocked_sha256_info : ident := 75%positive.
Definition ___builtin_va_arg : ident := 34%positive.
Definition ___builtin_memcpy_aligned : ident := 29%positive.
Definition _output : ident := 95%positive.
Definition ___builtin_bswap32 : ident := 55%positive.
Definition ___i64_shl : ident := 51%positive.
Definition ___i64_udiv : ident := 48%positive.
Definition ___builtin_fnmsub : ident := 65%positive.
Definition ___compcert_va_composite : ident := 40%positive.
Definition _data_len : ident := 112%positive.
Definition _reseed_interval : ident := 16%positive.
Definition ___compcert_va_int64 : ident := 38%positive.
Definition ___i64_utof : ident := 46%positive.
Definition _free : ident := 69%positive.
Definition ___builtin_fmadd : ident := 62%positive.
Definition ___builtin_bswap : ident := 54%positive.
Definition _input : ident := 92%positive.
Definition _additional : ident := 104%positive.
Definition ___builtin_write32_reversed : ident := 2%positive.
Definition _resistance : ident := 121%positive.
Definition ___builtin_annot_intval : ident := 31%positive.
Definition ___i64_smod : ident := 49%positive.
Definition ___builtin_read16_reversed : ident := 66%positive.
Definition ___builtin_fsqrt : ident := 59%positive.
Definition ___builtin_addl : ident := 4%positive.
Definition _mbedtls_md_hmac_update : ident := 94%positive.
Definition ___builtin_ctz : ident := 58%positive.
Definition _mbedtls_hmac_drbg_set_reseed_interval : ident := 125%positive.
Definition _v : ident := 99%positive.
Definition _data : ident := 21%positive.
Definition _h : ident := 18%positive.
Definition _md_len : ident := 106%positive.
Definition _mbedtls_md_get_size : ident := 80%positive.
Definition _reseed_counter : ident := 13%positive.
Definition ___builtin_va_start : ident := 33%positive.
Definition _mbedtls_hmac_drbg_set_entropy_len : ident := 123%positive.
Definition ___builtin_bswap16 : ident := 56%positive.
Definition _seed : ident := 115%positive.
Definition _n : ident := 100%positive.
Definition _Nh : ident := 20%positive.
Definition _ilen : ident := 93%positive.
Definition _add_len : ident := 105%positive.
Definition _p_rng : ident := 126%positive.
Definition _i_ctx : ident := 24%positive.
Definition ___builtin_read32_reversed : ident := 67%positive.
Definition ___builtin_subl : ident := 5%positive.
Definition _HMAC_Update : ident := 73%positive.
Definition ___i64_umod : ident := 50%positive.
Definition _HMAC_Final : ident := 74%positive.
Definition _rounds : ident := 107%positive.
Definition ___builtin_clz : ident := 57%positive.
Definition _entropy_len : ident := 14%positive.
Definition ___builtin_mull : ident := 6%positive.
Definition _custom : ident := 118%positive.
Definition _hmac_ctx_st : ident := 26%positive.
Definition _main : ident := 134%positive.
Definition ___compcert_va_float64 : ident := 39%positive.
Definition _mbedtls_md_hmac_starts : ident := 90%positive.
Definition _test_md_get_size : ident := 83%positive.
Definition _mbedtls_md_context_t : ident := 11%positive.
Definition _seedlen : ident := 116%positive.
Definition _info : ident := 81%positive.
Definition _md_name : ident := 76%positive.
Definition _sha_ctx : ident := 86%positive.
Definition _md_ctx : ident := 9%positive.
Definition _mbedtls_hmac_drbg_random_with_add : ident := 131%positive.
Definition ___builtin_fnmadd : ident := 64%positive.
Definition ___i64_shr : ident := 52%positive.
Definition ___i64_dtos : ident := 41%positive.
Definition _mbedtls_md_setup : ident := 87%positive.
Definition _mbedtls_md_info_from_string : ident := 77%positive.
Definition _mbedtls_hmac_drbg_seed : ident := 120%positive.
Definition ___builtin_va_copy : ident := 35%positive.
Definition ___builtin_annot : ident := 30%positive.
Definition _SHA256state_st : ident := 23%positive.

Definition v_mocked_sha256_info := {|
  gvar_info := (Tstruct _mbedtls_md_info_t noattr);
  gvar_init := (Init_space 4 :: nil);
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

Definition f_test_md_get_size := {|
  fn_return := tvoid;
  fn_callconv := cc_default;
  fn_params := nil;
  fn_vars := ((_info, (Tstruct _mbedtls_md_info_t noattr)) :: nil);
  fn_temps := ((_ret, tuchar) :: (135%positive, tuchar) :: nil);
  fn_body :=
(Ssequence
  (Scall (Some 135%positive)
    (Evar _mbedtls_md_get_size (Tfunction
                                 (Tcons
                                   (tptr (Tstruct _mbedtls_md_info_t noattr))
                                   Tnil) tuchar cc_default))
    ((Eaddrof (Evar _info (Tstruct _mbedtls_md_info_t noattr))
       (tptr (Tstruct _mbedtls_md_info_t noattr))) :: nil))
  (Sset _ret (Ecast (Etempvar 135%positive tuchar) tuchar)))
|}.

Definition f_mbedtls_md_setup := {|
  fn_return := tint;
  fn_callconv := cc_default;
  fn_params := ((_ctx, (tptr (Tstruct _mbedtls_md_context_t noattr))) ::
                (_md_info, (tptr (Tstruct _mbedtls_md_info_t noattr))) ::
                (_hmac, tint) :: nil);
  fn_vars := nil;
  fn_temps := ((_sha_ctx, (tptr (Tstruct _hmac_ctx_st noattr))) ::
               (136%positive, (tptr tvoid)) :: nil);
  fn_body :=
(Ssequence
  (Ssequence
    (Scall (Some 136%positive)
      (Evar _malloc (Tfunction (Tcons tuint Tnil) (tptr tvoid) cc_default))
      ((Esizeof (Tstruct _hmac_ctx_st noattr) tuint) :: nil))
    (Sset _sha_ctx
      (Ecast (Etempvar 136%positive (tptr tvoid))
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
  fn_temps := ((_hmac_ctx, (tptr (Tstruct _hmac_ctx_st noattr))) :: nil);
  fn_body :=
(Ssequence
  (Sset _hmac_ctx
    (Efield
      (Ederef (Etempvar _ctx (tptr (Tstruct _mbedtls_md_context_t noattr)))
        (Tstruct _mbedtls_md_context_t noattr)) _hmac_ctx (tptr tvoid)))
  (Ssequence
    (Scall None
      (Evar _HMAC_Init (Tfunction
                         (Tcons (tptr (Tstruct _hmac_ctx_st noattr))
                           (Tcons (tptr tuchar) (Tcons tint Tnil))) tvoid
                         cc_default))
      ((Etempvar _hmac_ctx (tptr (Tstruct _hmac_ctx_st noattr))) ::
       (Ecast (Etempvar _key (tptr tuchar)) (tptr tuchar)) ::
       (Etempvar _keylen tuint) :: nil))
    (Sreturn (Some (Econst_int (Int.repr 0) tint)))))
|}.

Definition f_mbedtls_md_hmac_reset := {|
  fn_return := tint;
  fn_callconv := cc_default;
  fn_params := ((_ctx, (tptr (Tstruct _mbedtls_md_context_t noattr))) :: nil);
  fn_vars := nil;
  fn_temps := ((_hmac_ctx, (tptr (Tstruct _hmac_ctx_st noattr))) :: nil);
  fn_body :=
(Ssequence
  (Sset _hmac_ctx
    (Efield
      (Ederef (Etempvar _ctx (tptr (Tstruct _mbedtls_md_context_t noattr)))
        (Tstruct _mbedtls_md_context_t noattr)) _hmac_ctx (tptr tvoid)))
  (Ssequence
    (Scall None
      (Evar _HMAC_Init (Tfunction
                         (Tcons (tptr (Tstruct _hmac_ctx_st noattr))
                           (Tcons (tptr tuchar) (Tcons tint Tnil))) tvoid
                         cc_default))
      ((Etempvar _hmac_ctx (tptr (Tstruct _hmac_ctx_st noattr))) ::
       (Ecast (Econst_int (Int.repr 0) tint) (tptr tvoid)) ::
       (Econst_int (Int.repr 32) tint) :: nil))
    (Sreturn (Some (Econst_int (Int.repr 0) tint)))))
|}.

Definition f_mbedtls_md_hmac_update := {|
  fn_return := tint;
  fn_callconv := cc_default;
  fn_params := ((_ctx, (tptr (Tstruct _mbedtls_md_context_t noattr))) ::
                (_input, (tptr tuchar)) :: (_ilen, tuint) :: nil);
  fn_vars := nil;
  fn_temps := ((_hmac_ctx, (tptr (Tstruct _hmac_ctx_st noattr))) :: nil);
  fn_body :=
(Ssequence
  (Sset _hmac_ctx
    (Efield
      (Ederef (Etempvar _ctx (tptr (Tstruct _mbedtls_md_context_t noattr)))
        (Tstruct _mbedtls_md_context_t noattr)) _hmac_ctx (tptr tvoid)))
  (Ssequence
    (Scall None
      (Evar _HMAC_Update (Tfunction
                           (Tcons (tptr (Tstruct _hmac_ctx_st noattr))
                             (Tcons (tptr tvoid) (Tcons tuint Tnil))) tvoid
                           cc_default))
      ((Etempvar _hmac_ctx (tptr (Tstruct _hmac_ctx_st noattr))) ::
       (Ecast (Etempvar _input (tptr tuchar)) (tptr tvoid)) ::
       (Etempvar _ilen tuint) :: nil))
    (Sreturn (Some (Econst_int (Int.repr 0) tint)))))
|}.

Definition f_mbedtls_md_hmac_finish := {|
  fn_return := tint;
  fn_callconv := cc_default;
  fn_params := ((_ctx, (tptr (Tstruct _mbedtls_md_context_t noattr))) ::
                (_output, (tptr tuchar)) :: nil);
  fn_vars := nil;
  fn_temps := ((_hmac_ctx, (tptr (Tstruct _hmac_ctx_st noattr))) :: nil);
  fn_body :=
(Ssequence
  (Sset _hmac_ctx
    (Efield
      (Ederef (Etempvar _ctx (tptr (Tstruct _mbedtls_md_context_t noattr)))
        (Tstruct _mbedtls_md_context_t noattr)) _hmac_ctx (tptr tvoid)))
  (Ssequence
    (Scall None
      (Evar _HMAC_Final (Tfunction
                          (Tcons (tptr (Tstruct _hmac_ctx_st noattr))
                            (Tcons (tptr tuchar) Tnil)) tvoid cc_default))
      ((Etempvar _hmac_ctx (tptr (Tstruct _hmac_ctx_st noattr))) ::
       (Etempvar _output (tptr tuchar)) :: nil))
    (Sreturn (Some (Econst_int (Int.repr 0) tint)))))
|}.

Definition f_mbedtls_md_free := {|
  fn_return := tvoid;
  fn_callconv := cc_default;
  fn_params := ((_ctx, (tptr (Tstruct _mbedtls_md_context_t noattr))) :: nil);
  fn_vars := nil;
  fn_temps := ((_hmac_ctx, (tptr (Tstruct _hmac_ctx_st noattr))) :: nil);
  fn_body :=
(Ssequence
  (Sset _hmac_ctx
    (Efield
      (Ederef (Etempvar _ctx (tptr (Tstruct _mbedtls_md_context_t noattr)))
        (Tstruct _mbedtls_md_context_t noattr)) _hmac_ctx (tptr tvoid)))
  (Scall None
    (Evar _free (Tfunction (Tcons (tptr tvoid) Tnil) tvoid cc_default))
    ((Etempvar _hmac_ctx (tptr (Tstruct _hmac_ctx_st noattr))) :: nil)))
|}.

Definition f_mbedtls_zeroize := {|
  fn_return := tvoid;
  fn_callconv := cc_default;
  fn_params := ((_v, (tptr tvoid)) :: (_n, tuint) :: nil);
  fn_vars := nil;
  fn_temps := ((_p, (tptr (tvolatile tuchar))) ::
               (138%positive, (tptr (tvolatile tuchar))) ::
               (137%positive, tuint) :: nil);
  fn_body :=
(Ssequence
  (Sset _p (Etempvar _v (tptr tvoid)))
  (Sloop
    (Ssequence
      (Ssequence
        (Ssequence
          (Sset 137%positive (Etempvar _n tuint))
          (Sset _n
            (Ebinop Osub (Etempvar 137%positive tuint)
              (Econst_int (Int.repr 1) tint) tuint)))
        (Sifthenelse (Etempvar 137%positive tuint) Sskip Sbreak))
      (Ssequence
        (Ssequence
          (Sset 138%positive (Etempvar _p (tptr (tvolatile tuchar))))
          (Sset _p
            (Ebinop Oadd (Etempvar 138%positive (tptr (tvolatile tuchar)))
              (Econst_int (Int.repr 1) tint) (tptr (tvolatile tuchar)))))
        (Sbuiltin None (EF_vstore Mint8unsigned)
          (Tcons (tptr (tvolatile tuchar)) (Tcons (tvolatile tuchar) Tnil))
          ((Eaddrof
             (Ederef (Etempvar 138%positive (tptr (tvolatile tuchar)))
               (tvolatile tuchar)) (tptr (tvolatile tuchar))) ::
           (Econst_int (Int.repr 0) tint) :: nil))))
    Sskip))
|}.

Definition f_mbedtls_hmac_drbg_init := {|
  fn_return := tvoid;
  fn_callconv := cc_default;
  fn_params := ((_ctx, (tptr (Tstruct _mbedtls_hmac_drbg_context noattr))) ::
                nil);
  fn_vars := nil;
  fn_temps := nil;
  fn_body :=
(Scall None
  (Evar _memset (Tfunction
                  (Tcons (tptr tvoid) (Tcons tint (Tcons tuint Tnil)))
                  (tptr tvoid) cc_default))
  ((Etempvar _ctx (tptr (Tstruct _mbedtls_hmac_drbg_context noattr))) ::
   (Econst_int (Int.repr 0) tint) ::
   (Esizeof (Tstruct _mbedtls_hmac_drbg_context noattr) tuint) :: nil))
|}.

Definition f_mbedtls_hmac_drbg_update := {|
  fn_return := tvoid;
  fn_callconv := cc_default;
  fn_params := ((_ctx, (tptr (Tstruct _mbedtls_hmac_drbg_context noattr))) ::
                (_additional, (tptr tuchar)) :: (_add_len, tuint) :: nil);
  fn_vars := ((_sep, (tarray tuchar 1)) :: (_K, (tarray tuchar 32)) :: nil);
  fn_temps := ((_info, (tptr (Tstruct _mbedtls_md_info_t noattr))) ::
               (_md_len, tuint) :: (_rounds, tint) :: (_sep_value, tint) ::
               (141%positive, tint) :: (140%positive, tint) ::
               (139%positive, tuchar) :: nil);
  fn_body :=
(Ssequence
  (Sset _info
    (Efield
      (Efield
        (Ederef
          (Etempvar _ctx (tptr (Tstruct _mbedtls_hmac_drbg_context noattr)))
          (Tstruct _mbedtls_hmac_drbg_context noattr)) _md_ctx
        (Tstruct _mbedtls_md_context_t noattr)) _md_info
      (tptr (Tstruct _mbedtls_md_info_t noattr))))
  (Ssequence
    (Ssequence
      (Scall (Some 139%positive)
        (Evar _mbedtls_md_get_size (Tfunction
                                     (Tcons
                                       (tptr (Tstruct _mbedtls_md_info_t noattr))
                                       Tnil) tuchar cc_default))
        ((Etempvar _info (tptr (Tstruct _mbedtls_md_info_t noattr))) :: nil))
      (Sset _md_len (Etempvar 139%positive tuchar)))
    (Ssequence
      (Ssequence
        (Ssequence
          (Sifthenelse (Ebinop One (Etempvar _add_len tuint)
                         (Econst_int (Int.repr 0) tint) tint)
            (Sset 140%positive
              (Ecast
                (Ebinop One (Etempvar _additional (tptr tuchar))
                  (Ecast (Econst_int (Int.repr 0) tint) (tptr tvoid)) tint)
                tbool))
            (Sset 140%positive (Econst_int (Int.repr 0) tint)))
          (Sifthenelse (Etempvar 140%positive tint)
            (Sset 141%positive (Ecast (Econst_int (Int.repr 2) tint) tint))
            (Sset 141%positive (Ecast (Econst_int (Int.repr 1) tint) tint))))
        (Sset _rounds (Etempvar 141%positive tint)))
      (Ssequence
        (Sset _sep_value (Econst_int (Int.repr 0) tint))
        (Sloop
          (Ssequence
            (Sifthenelse (Ebinop Olt (Etempvar _sep_value tint)
                           (Etempvar _rounds tint) tint)
              Sskip
              Sbreak)
            (Ssequence
              (Sassign
                (Ederef
                  (Ebinop Oadd (Evar _sep (tarray tuchar 1))
                    (Econst_int (Int.repr 0) tint) (tptr tuchar)) tuchar)
                (Etempvar _sep_value tint))
              (Ssequence
                (Scall None
                  (Evar _mbedtls_md_hmac_reset (Tfunction
                                                 (Tcons
                                                   (tptr (Tstruct _mbedtls_md_context_t noattr))
                                                   Tnil) tint cc_default))
                  ((Eaddrof
                     (Efield
                       (Ederef
                         (Etempvar _ctx (tptr (Tstruct _mbedtls_hmac_drbg_context noattr)))
                         (Tstruct _mbedtls_hmac_drbg_context noattr)) _md_ctx
                       (Tstruct _mbedtls_md_context_t noattr))
                     (tptr (Tstruct _mbedtls_md_context_t noattr))) :: nil))
                (Ssequence
                  (Scall None
                    (Evar _mbedtls_md_hmac_update (Tfunction
                                                    (Tcons
                                                      (tptr (Tstruct _mbedtls_md_context_t noattr))
                                                      (Tcons (tptr tuchar)
                                                        (Tcons tuint Tnil)))
                                                    tint cc_default))
                    ((Eaddrof
                       (Efield
                         (Ederef
                           (Etempvar _ctx (tptr (Tstruct _mbedtls_hmac_drbg_context noattr)))
                           (Tstruct _mbedtls_hmac_drbg_context noattr))
                         _md_ctx (Tstruct _mbedtls_md_context_t noattr))
                       (tptr (Tstruct _mbedtls_md_context_t noattr))) ::
                     (Efield
                       (Ederef
                         (Etempvar _ctx (tptr (Tstruct _mbedtls_hmac_drbg_context noattr)))
                         (Tstruct _mbedtls_hmac_drbg_context noattr)) _V
                       (tarray tuchar 32)) :: (Etempvar _md_len tuint) ::
                     nil))
                  (Ssequence
                    (Scall None
                      (Evar _mbedtls_md_hmac_update (Tfunction
                                                      (Tcons
                                                        (tptr (Tstruct _mbedtls_md_context_t noattr))
                                                        (Tcons (tptr tuchar)
                                                          (Tcons tuint Tnil)))
                                                      tint cc_default))
                      ((Eaddrof
                         (Efield
                           (Ederef
                             (Etempvar _ctx (tptr (Tstruct _mbedtls_hmac_drbg_context noattr)))
                             (Tstruct _mbedtls_hmac_drbg_context noattr))
                           _md_ctx (Tstruct _mbedtls_md_context_t noattr))
                         (tptr (Tstruct _mbedtls_md_context_t noattr))) ::
                       (Evar _sep (tarray tuchar 1)) ::
                       (Econst_int (Int.repr 1) tint) :: nil))
                    (Ssequence
                      (Sifthenelse (Ebinop Oeq (Etempvar _rounds tint)
                                     (Econst_int (Int.repr 2) tint) tint)
                        (Scall None
                          (Evar _mbedtls_md_hmac_update (Tfunction
                                                          (Tcons
                                                            (tptr (Tstruct _mbedtls_md_context_t noattr))
                                                            (Tcons
                                                              (tptr tuchar)
                                                              (Tcons tuint
                                                                Tnil))) tint
                                                          cc_default))
                          ((Eaddrof
                             (Efield
                               (Ederef
                                 (Etempvar _ctx (tptr (Tstruct _mbedtls_hmac_drbg_context noattr)))
                                 (Tstruct _mbedtls_hmac_drbg_context noattr))
                               _md_ctx
                               (Tstruct _mbedtls_md_context_t noattr))
                             (tptr (Tstruct _mbedtls_md_context_t noattr))) ::
                           (Etempvar _additional (tptr tuchar)) ::
                           (Etempvar _add_len tuint) :: nil))
                        Sskip)
                      (Ssequence
                        (Scall None
                          (Evar _mbedtls_md_hmac_finish (Tfunction
                                                          (Tcons
                                                            (tptr (Tstruct _mbedtls_md_context_t noattr))
                                                            (Tcons
                                                              (tptr tuchar)
                                                              Tnil)) tint
                                                          cc_default))
                          ((Eaddrof
                             (Efield
                               (Ederef
                                 (Etempvar _ctx (tptr (Tstruct _mbedtls_hmac_drbg_context noattr)))
                                 (Tstruct _mbedtls_hmac_drbg_context noattr))
                               _md_ctx
                               (Tstruct _mbedtls_md_context_t noattr))
                             (tptr (Tstruct _mbedtls_md_context_t noattr))) ::
                           (Evar _K (tarray tuchar 32)) :: nil))
                        (Ssequence
                          (Scall None
                            (Evar _mbedtls_md_hmac_starts (Tfunction
                                                            (Tcons
                                                              (tptr (Tstruct _mbedtls_md_context_t noattr))
                                                              (Tcons
                                                                (tptr tuchar)
                                                                (Tcons tuint
                                                                  Tnil)))
                                                            tint cc_default))
                            ((Eaddrof
                               (Efield
                                 (Ederef
                                   (Etempvar _ctx (tptr (Tstruct _mbedtls_hmac_drbg_context noattr)))
                                   (Tstruct _mbedtls_hmac_drbg_context noattr))
                                 _md_ctx
                                 (Tstruct _mbedtls_md_context_t noattr))
                               (tptr (Tstruct _mbedtls_md_context_t noattr))) ::
                             (Evar _K (tarray tuchar 32)) ::
                             (Etempvar _md_len tuint) :: nil))
                          (Ssequence
                            (Scall None
                              (Evar _mbedtls_md_hmac_update (Tfunction
                                                              (Tcons
                                                                (tptr (Tstruct _mbedtls_md_context_t noattr))
                                                                (Tcons
                                                                  (tptr tuchar)
                                                                  (Tcons
                                                                    tuint
                                                                    Tnil)))
                                                              tint
                                                              cc_default))
                              ((Eaddrof
                                 (Efield
                                   (Ederef
                                     (Etempvar _ctx (tptr (Tstruct _mbedtls_hmac_drbg_context noattr)))
                                     (Tstruct _mbedtls_hmac_drbg_context noattr))
                                   _md_ctx
                                   (Tstruct _mbedtls_md_context_t noattr))
                                 (tptr (Tstruct _mbedtls_md_context_t noattr))) ::
                               (Efield
                                 (Ederef
                                   (Etempvar _ctx (tptr (Tstruct _mbedtls_hmac_drbg_context noattr)))
                                   (Tstruct _mbedtls_hmac_drbg_context noattr))
                                 _V (tarray tuchar 32)) ::
                               (Etempvar _md_len tuint) :: nil))
                            (Scall None
                              (Evar _mbedtls_md_hmac_finish (Tfunction
                                                              (Tcons
                                                                (tptr (Tstruct _mbedtls_md_context_t noattr))
                                                                (Tcons
                                                                  (tptr tuchar)
                                                                  Tnil)) tint
                                                              cc_default))
                              ((Eaddrof
                                 (Efield
                                   (Ederef
                                     (Etempvar _ctx (tptr (Tstruct _mbedtls_hmac_drbg_context noattr)))
                                     (Tstruct _mbedtls_hmac_drbg_context noattr))
                                   _md_ctx
                                   (Tstruct _mbedtls_md_context_t noattr))
                                 (tptr (Tstruct _mbedtls_md_context_t noattr))) ::
                               (Efield
                                 (Ederef
                                   (Etempvar _ctx (tptr (Tstruct _mbedtls_hmac_drbg_context noattr)))
                                   (Tstruct _mbedtls_hmac_drbg_context noattr))
                                 _V (tarray tuchar 32)) :: nil)))))))))))
          (Sset _sep_value
            (Ebinop Oadd (Etempvar _sep_value tint)
              (Econst_int (Int.repr 1) tint) tint)))))))
|}.

Definition f_mbedtls_hmac_drbg_seed_buf := {|
  fn_return := tint;
  fn_callconv := cc_default;
  fn_params := ((_ctx, (tptr (Tstruct _mbedtls_hmac_drbg_context noattr))) ::
                (_md_info, (tptr (Tstruct _mbedtls_md_info_t noattr))) ::
                (_data, (tptr tuchar)) :: (_data_len, tuint) :: nil);
  fn_vars := nil;
  fn_temps := ((_ret, tint) :: (145%positive, tuchar) ::
               (144%positive, tuchar) :: (143%positive, tint) ::
               (142%positive, tint) :: nil);
  fn_body :=
(Ssequence
  (Ssequence
    (Ssequence
      (Ssequence
        (Scall (Some 142%positive)
          (Evar _mbedtls_md_setup (Tfunction
                                    (Tcons
                                      (tptr (Tstruct _mbedtls_md_context_t noattr))
                                      (Tcons
                                        (tptr (Tstruct _mbedtls_md_info_t noattr))
                                        (Tcons tint Tnil))) tint cc_default))
          ((Eaddrof
             (Efield
               (Ederef
                 (Etempvar _ctx (tptr (Tstruct _mbedtls_hmac_drbg_context noattr)))
                 (Tstruct _mbedtls_hmac_drbg_context noattr)) _md_ctx
               (Tstruct _mbedtls_md_context_t noattr))
             (tptr (Tstruct _mbedtls_md_context_t noattr))) ::
           (Etempvar _md_info (tptr (Tstruct _mbedtls_md_info_t noattr))) ::
           (Econst_int (Int.repr 1) tint) :: nil))
        (Sset 143%positive (Etempvar 142%positive tint)))
      (Sset _ret (Etempvar 143%positive tint)))
    (Sifthenelse (Ebinop One (Ecast (Etempvar 143%positive tint) tint)
                   (Econst_int (Int.repr 0) tint) tint)
      (Sreturn (Some (Etempvar _ret tint)))
      Sskip))
  (Ssequence
    (Ssequence
      (Scall (Some 144%positive)
        (Evar _mbedtls_md_get_size (Tfunction
                                     (Tcons
                                       (tptr (Tstruct _mbedtls_md_info_t noattr))
                                       Tnil) tuchar cc_default))
        ((Etempvar _md_info (tptr (Tstruct _mbedtls_md_info_t noattr))) ::
         nil))
      (Scall None
        (Evar _mbedtls_md_hmac_starts (Tfunction
                                        (Tcons
                                          (tptr (Tstruct _mbedtls_md_context_t noattr))
                                          (Tcons (tptr tuchar)
                                            (Tcons tuint Tnil))) tint
                                        cc_default))
        ((Eaddrof
           (Efield
             (Ederef
               (Etempvar _ctx (tptr (Tstruct _mbedtls_hmac_drbg_context noattr)))
               (Tstruct _mbedtls_hmac_drbg_context noattr)) _md_ctx
             (Tstruct _mbedtls_md_context_t noattr))
           (tptr (Tstruct _mbedtls_md_context_t noattr))) ::
         (Efield
           (Ederef
             (Etempvar _ctx (tptr (Tstruct _mbedtls_hmac_drbg_context noattr)))
             (Tstruct _mbedtls_hmac_drbg_context noattr)) _V
           (tarray tuchar 32)) :: (Etempvar 144%positive tuchar) :: nil)))
    (Ssequence
      (Ssequence
        (Scall (Some 145%positive)
          (Evar _mbedtls_md_get_size (Tfunction
                                       (Tcons
                                         (tptr (Tstruct _mbedtls_md_info_t noattr))
                                         Tnil) tuchar cc_default))
          ((Etempvar _md_info (tptr (Tstruct _mbedtls_md_info_t noattr))) ::
           nil))
        (Scall None
          (Evar _memset (Tfunction
                          (Tcons (tptr tvoid)
                            (Tcons tint (Tcons tuint Tnil))) (tptr tvoid)
                          cc_default))
          ((Efield
             (Ederef
               (Etempvar _ctx (tptr (Tstruct _mbedtls_hmac_drbg_context noattr)))
               (Tstruct _mbedtls_hmac_drbg_context noattr)) _V
             (tarray tuchar 32)) :: (Econst_int (Int.repr 1) tint) ::
           (Etempvar 145%positive tuchar) :: nil)))
      (Ssequence
        (Scall None
          (Evar _mbedtls_hmac_drbg_update (Tfunction
                                            (Tcons
                                              (tptr (Tstruct _mbedtls_hmac_drbg_context noattr))
                                              (Tcons (tptr tuchar)
                                                (Tcons tuint Tnil))) tvoid
                                            cc_default))
          ((Etempvar _ctx (tptr (Tstruct _mbedtls_hmac_drbg_context noattr))) ::
           (Etempvar _data (tptr tuchar)) :: (Etempvar _data_len tuint) ::
           nil))
        (Sreturn (Some (Econst_int (Int.repr 0) tint)))))))
|}.

Definition f_mbedtls_hmac_drbg_reseed := {|
  fn_return := tint;
  fn_callconv := cc_default;
  fn_params := ((_ctx, (tptr (Tstruct _mbedtls_hmac_drbg_context noattr))) ::
                (_additional, (tptr tuchar)) :: (_len, tuint) :: nil);
  fn_vars := ((_seed, (tarray tuchar 384)) :: nil);
  fn_temps := ((_seedlen, tuint) :: (_entropy_len, tuint) ::
               (148%positive, tint) :: (147%positive, tint) ::
               (146%positive, tint) :: nil);
  fn_body :=
(Ssequence
  (Sset _entropy_len
    (Efield
      (Ederef
        (Etempvar _ctx (tptr (Tstruct _mbedtls_hmac_drbg_context noattr)))
        (Tstruct _mbedtls_hmac_drbg_context noattr)) _entropy_len tuint))
  (Ssequence
    (Ssequence
      (Sifthenelse (Ebinop Ogt (Etempvar _len tuint)
                     (Econst_int (Int.repr 256) tint) tint)
        (Sset 146%positive (Econst_int (Int.repr 1) tint))
        (Sset 146%positive
          (Ecast
            (Ebinop Ogt
              (Ebinop Oadd (Etempvar _entropy_len tuint)
                (Etempvar _len tuint) tuint) (Econst_int (Int.repr 384) tint)
              tint) tbool)))
      (Sifthenelse (Etempvar 146%positive tint)
        (Sreturn (Some (Eunop Oneg (Econst_int (Int.repr 5) tint) tint)))
        Sskip))
    (Ssequence
      (Scall None
        (Evar _memset (Tfunction
                        (Tcons (tptr tvoid) (Tcons tint (Tcons tuint Tnil)))
                        (tptr tvoid) cc_default))
        ((Evar _seed (tarray tuchar 384)) ::
         (Econst_int (Int.repr 0) tint) ::
         (Econst_int (Int.repr 384) tint) :: nil))
      (Ssequence
        (Ssequence
          (Scall (Some 147%positive)
            (Evar _get_entropy (Tfunction
                                 (Tcons (tptr tuchar) (Tcons tuint Tnil))
                                 tint cc_default))
            ((Evar _seed (tarray tuchar 384)) ::
             (Etempvar _entropy_len tuint) :: nil))
          (Sifthenelse (Ebinop One (Etempvar 147%positive tint)
                         (Econst_int (Int.repr 0) tint) tint)
            (Sreturn (Some (Eunop Oneg (Econst_int (Int.repr 9) tint) tint)))
            Sskip))
        (Ssequence
          (Sset _seedlen (Etempvar _entropy_len tuint))
          (Ssequence
            (Ssequence
              (Sifthenelse (Ebinop One (Etempvar _additional (tptr tuchar))
                             (Ecast (Econst_int (Int.repr 0) tint)
                               (tptr tvoid)) tint)
                (Sset 148%positive
                  (Ecast
                    (Ebinop One (Etempvar _len tuint)
                      (Econst_int (Int.repr 0) tint) tint) tbool))
                (Sset 148%positive (Econst_int (Int.repr 0) tint)))
              (Sifthenelse (Etempvar 148%positive tint)
                (Ssequence
                  (Scall None
                    (Evar _memcpy (Tfunction
                                    (Tcons (tptr tvoid)
                                      (Tcons (tptr tvoid) (Tcons tuint Tnil)))
                                    (tptr tvoid) cc_default))
                    ((Ebinop Oadd (Evar _seed (tarray tuchar 384))
                       (Etempvar _seedlen tuint) (tptr tuchar)) ::
                     (Etempvar _additional (tptr tuchar)) ::
                     (Etempvar _len tuint) :: nil))
                  (Sset _seedlen
                    (Ebinop Oadd (Etempvar _seedlen tuint)
                      (Etempvar _len tuint) tuint)))
                Sskip))
            (Ssequence
              (Scall None
                (Evar _mbedtls_hmac_drbg_update (Tfunction
                                                  (Tcons
                                                    (tptr (Tstruct _mbedtls_hmac_drbg_context noattr))
                                                    (Tcons (tptr tuchar)
                                                      (Tcons tuint Tnil)))
                                                  tvoid cc_default))
                ((Etempvar _ctx (tptr (Tstruct _mbedtls_hmac_drbg_context noattr))) ::
                 (Evar _seed (tarray tuchar 384)) ::
                 (Etempvar _seedlen tuint) :: nil))
              (Ssequence
                (Sassign
                  (Efield
                    (Ederef
                      (Etempvar _ctx (tptr (Tstruct _mbedtls_hmac_drbg_context noattr)))
                      (Tstruct _mbedtls_hmac_drbg_context noattr))
                    _reseed_counter tint) (Econst_int (Int.repr 1) tint))
                (Sreturn (Some (Econst_int (Int.repr 0) tint)))))))))))
|}.

Definition f_mbedtls_hmac_drbg_seed := {|
  fn_return := tint;
  fn_callconv := cc_default;
  fn_params := ((_ctx, (tptr (Tstruct _mbedtls_hmac_drbg_context noattr))) ::
                (_md_info, (tptr (Tstruct _mbedtls_md_info_t noattr))) ::
                (_custom, (tptr tuchar)) :: (_len, tuint) :: nil);
  fn_vars := nil;
  fn_temps := ((_ret, tint) :: (_entropy_len, tuint) :: (_md_size, tuint) ::
               (155%positive, tint) :: (154%positive, tint) ::
               (153%positive, tint) :: (152%positive, tint) ::
               (151%positive, tuchar) :: (150%positive, tint) ::
               (149%positive, tint) :: nil);
  fn_body :=
(Ssequence
  (Ssequence
    (Ssequence
      (Ssequence
        (Scall (Some 149%positive)
          (Evar _mbedtls_md_setup (Tfunction
                                    (Tcons
                                      (tptr (Tstruct _mbedtls_md_context_t noattr))
                                      (Tcons
                                        (tptr (Tstruct _mbedtls_md_info_t noattr))
                                        (Tcons tint Tnil))) tint cc_default))
          ((Eaddrof
             (Efield
               (Ederef
                 (Etempvar _ctx (tptr (Tstruct _mbedtls_hmac_drbg_context noattr)))
                 (Tstruct _mbedtls_hmac_drbg_context noattr)) _md_ctx
               (Tstruct _mbedtls_md_context_t noattr))
             (tptr (Tstruct _mbedtls_md_context_t noattr))) ::
           (Etempvar _md_info (tptr (Tstruct _mbedtls_md_info_t noattr))) ::
           (Econst_int (Int.repr 1) tint) :: nil))
        (Sset 150%positive (Etempvar 149%positive tint)))
      (Sset _ret (Etempvar 150%positive tint)))
    (Sifthenelse (Ebinop One (Ecast (Etempvar 150%positive tint) tint)
                   (Econst_int (Int.repr 0) tint) tint)
      (Sreturn (Some (Etempvar _ret tint)))
      Sskip))
  (Ssequence
    (Ssequence
      (Scall (Some 151%positive)
        (Evar _mbedtls_md_get_size (Tfunction
                                     (Tcons
                                       (tptr (Tstruct _mbedtls_md_info_t noattr))
                                       Tnil) tuchar cc_default))
        ((Etempvar _md_info (tptr (Tstruct _mbedtls_md_info_t noattr))) ::
         nil))
      (Sset _md_size (Etempvar 151%positive tuchar)))
    (Ssequence
      (Scall None
        (Evar _mbedtls_md_hmac_starts (Tfunction
                                        (Tcons
                                          (tptr (Tstruct _mbedtls_md_context_t noattr))
                                          (Tcons (tptr tuchar)
                                            (Tcons tuint Tnil))) tint
                                        cc_default))
        ((Eaddrof
           (Efield
             (Ederef
               (Etempvar _ctx (tptr (Tstruct _mbedtls_hmac_drbg_context noattr)))
               (Tstruct _mbedtls_hmac_drbg_context noattr)) _md_ctx
             (Tstruct _mbedtls_md_context_t noattr))
           (tptr (Tstruct _mbedtls_md_context_t noattr))) ::
         (Efield
           (Ederef
             (Etempvar _ctx (tptr (Tstruct _mbedtls_hmac_drbg_context noattr)))
             (Tstruct _mbedtls_hmac_drbg_context noattr)) _V
           (tarray tuchar 32)) :: (Etempvar _md_size tuint) :: nil))
      (Ssequence
        (Scall None
          (Evar _memset (Tfunction
                          (Tcons (tptr tvoid)
                            (Tcons tint (Tcons tuint Tnil))) (tptr tvoid)
                          cc_default))
          ((Efield
             (Ederef
               (Etempvar _ctx (tptr (Tstruct _mbedtls_hmac_drbg_context noattr)))
               (Tstruct _mbedtls_hmac_drbg_context noattr)) _V
             (tarray tuchar 32)) :: (Econst_int (Int.repr 1) tint) ::
           (Etempvar _md_size tuint) :: nil))
        (Ssequence
          (Sassign
            (Efield
              (Ederef
                (Etempvar _ctx (tptr (Tstruct _mbedtls_hmac_drbg_context noattr)))
                (Tstruct _mbedtls_hmac_drbg_context noattr)) _reseed_interval
              tint) (Econst_int (Int.repr 10000) tint))
          (Ssequence
            (Ssequence
              (Sifthenelse (Ebinop Ole (Etempvar _md_size tuint)
                             (Econst_int (Int.repr 20) tint) tint)
                (Sset 152%positive
                  (Ecast (Econst_int (Int.repr 16) tint) tint))
                (Sifthenelse (Ebinop Ole (Etempvar _md_size tuint)
                               (Econst_int (Int.repr 28) tint) tint)
                  (Ssequence
                    (Sset 153%positive
                      (Ecast (Econst_int (Int.repr 24) tint) tint))
                    (Sset 152%positive
                      (Ecast (Etempvar 153%positive tint) tint)))
                  (Ssequence
                    (Sset 153%positive
                      (Ecast (Econst_int (Int.repr 32) tint) tint))
                    (Sset 152%positive
                      (Ecast (Etempvar 153%positive tint) tint)))))
              (Sset _entropy_len (Etempvar 152%positive tint)))
            (Ssequence
              (Sassign
                (Efield
                  (Ederef
                    (Etempvar _ctx (tptr (Tstruct _mbedtls_hmac_drbg_context noattr)))
                    (Tstruct _mbedtls_hmac_drbg_context noattr)) _entropy_len
                  tuint)
                (Ebinop Odiv
                  (Ebinop Omul (Etempvar _entropy_len tuint)
                    (Econst_int (Int.repr 3) tint) tuint)
                  (Econst_int (Int.repr 2) tint) tuint))
              (Ssequence
                (Ssequence
                  (Ssequence
                    (Ssequence
                      (Scall (Some 154%positive)
                        (Evar _mbedtls_hmac_drbg_reseed (Tfunction
                                                          (Tcons
                                                            (tptr (Tstruct _mbedtls_hmac_drbg_context noattr))
                                                            (Tcons
                                                              (tptr tuchar)
                                                              (Tcons tuint
                                                                Tnil))) tint
                                                          cc_default))
                        ((Etempvar _ctx (tptr (Tstruct _mbedtls_hmac_drbg_context noattr))) ::
                         (Etempvar _custom (tptr tuchar)) ::
                         (Etempvar _len tuint) :: nil))
                      (Sset 155%positive (Etempvar 154%positive tint)))
                    (Sset _ret (Etempvar 155%positive tint)))
                  (Sifthenelse (Ebinop One
                                 (Ecast (Etempvar 155%positive tint) tint)
                                 (Econst_int (Int.repr 0) tint) tint)
                    (Sreturn (Some (Etempvar _ret tint)))
                    Sskip))
                (Ssequence
                  (Sassign
                    (Efield
                      (Ederef
                        (Etempvar _ctx (tptr (Tstruct _mbedtls_hmac_drbg_context noattr)))
                        (Tstruct _mbedtls_hmac_drbg_context noattr))
                      _entropy_len tuint) (Etempvar _entropy_len tuint))
                  (Sreturn (Some (Econst_int (Int.repr 0) tint))))))))))))
|}.

Definition f_mbedtls_hmac_drbg_set_prediction_resistance := {|
  fn_return := tvoid;
  fn_callconv := cc_default;
  fn_params := ((_ctx, (tptr (Tstruct _mbedtls_hmac_drbg_context noattr))) ::
                (_resistance, tint) :: nil);
  fn_vars := nil;
  fn_temps := nil;
  fn_body :=
(Sassign
  (Efield
    (Ederef
      (Etempvar _ctx (tptr (Tstruct _mbedtls_hmac_drbg_context noattr)))
      (Tstruct _mbedtls_hmac_drbg_context noattr)) _prediction_resistance
    tint) (Etempvar _resistance tint))
|}.

Definition f_mbedtls_hmac_drbg_set_entropy_len := {|
  fn_return := tvoid;
  fn_callconv := cc_default;
  fn_params := ((_ctx, (tptr (Tstruct _mbedtls_hmac_drbg_context noattr))) ::
                (_len, tuint) :: nil);
  fn_vars := nil;
  fn_temps := nil;
  fn_body :=
(Sassign
  (Efield
    (Ederef
      (Etempvar _ctx (tptr (Tstruct _mbedtls_hmac_drbg_context noattr)))
      (Tstruct _mbedtls_hmac_drbg_context noattr)) _entropy_len tuint)
  (Etempvar _len tuint))
|}.

Definition f_mbedtls_hmac_drbg_set_reseed_interval := {|
  fn_return := tvoid;
  fn_callconv := cc_default;
  fn_params := ((_ctx, (tptr (Tstruct _mbedtls_hmac_drbg_context noattr))) ::
                (_interval, tint) :: nil);
  fn_vars := nil;
  fn_temps := nil;
  fn_body :=
(Sassign
  (Efield
    (Ederef
      (Etempvar _ctx (tptr (Tstruct _mbedtls_hmac_drbg_context noattr)))
      (Tstruct _mbedtls_hmac_drbg_context noattr)) _reseed_interval tint)
  (Etempvar _interval tint))
|}.

Definition f_mbedtls_hmac_drbg_random_with_add := {|
  fn_return := tint;
  fn_callconv := cc_default;
  fn_params := ((_p_rng, (tptr tvoid)) :: (_output, (tptr tuchar)) ::
                (_out_len, tuint) :: (_additional, (tptr tuchar)) ::
                (_add_len, tuint) :: nil);
  fn_vars := nil;
  fn_temps := ((_ret, tint) ::
               (_ctx, (tptr (Tstruct _mbedtls_hmac_drbg_context noattr))) ::
               (_md_len, tuint) :: (_left, tuint) :: (_out, (tptr tuchar)) ::
               (_info, (tptr (Tstruct _mbedtls_md_info_t noattr))) ::
               (_prediction_resistance, tint) :: (_reseed_counter, tint) ::
               (_reseed_interval, tint) :: (_use_len, tuint) ::
               (161%positive, tuint) :: (160%positive, tint) ::
               (159%positive, tint) :: (158%positive, tint) ::
               (157%positive, tint) :: (156%positive, tuchar) :: nil);
  fn_body :=
(Ssequence
  (Sset _ctx
    (Ecast (Etempvar _p_rng (tptr tvoid))
      (tptr (Tstruct _mbedtls_hmac_drbg_context noattr))))
  (Ssequence
    (Sset _left (Etempvar _out_len tuint))
    (Ssequence
      (Sset _out (Etempvar _output (tptr tuchar)))
      (Ssequence
        (Sset _prediction_resistance
          (Efield
            (Ederef
              (Etempvar _ctx (tptr (Tstruct _mbedtls_hmac_drbg_context noattr)))
              (Tstruct _mbedtls_hmac_drbg_context noattr))
            _prediction_resistance tint))
        (Ssequence
          (Sset _reseed_counter
            (Efield
              (Ederef
                (Etempvar _ctx (tptr (Tstruct _mbedtls_hmac_drbg_context noattr)))
                (Tstruct _mbedtls_hmac_drbg_context noattr)) _reseed_counter
              tint))
          (Ssequence
            (Sset _reseed_interval
              (Efield
                (Ederef
                  (Etempvar _ctx (tptr (Tstruct _mbedtls_hmac_drbg_context noattr)))
                  (Tstruct _mbedtls_hmac_drbg_context noattr))
                _reseed_interval tint))
            (Ssequence
              (Sset _info
                (Efield
                  (Efield
                    (Ederef
                      (Etempvar _ctx (tptr (Tstruct _mbedtls_hmac_drbg_context noattr)))
                      (Tstruct _mbedtls_hmac_drbg_context noattr)) _md_ctx
                    (Tstruct _mbedtls_md_context_t noattr)) _md_info
                  (tptr (Tstruct _mbedtls_md_info_t noattr))))
              (Ssequence
                (Ssequence
                  (Scall (Some 156%positive)
                    (Evar _mbedtls_md_get_size (Tfunction
                                                 (Tcons
                                                   (tptr (Tstruct _mbedtls_md_info_t noattr))
                                                   Tnil) tuchar cc_default))
                    ((Etempvar _info (tptr (Tstruct _mbedtls_md_info_t noattr))) ::
                     nil))
                  (Sset _md_len (Etempvar 156%positive tuchar)))
                (Ssequence
                  (Sifthenelse (Ebinop Ogt (Etempvar _out_len tuint)
                                 (Econst_int (Int.repr 1024) tint) tint)
                    (Sreturn (Some (Eunop Oneg (Econst_int (Int.repr 3) tint)
                                     tint)))
                    Sskip)
                  (Ssequence
                    (Sifthenelse (Ebinop Ogt (Etempvar _add_len tuint)
                                   (Econst_int (Int.repr 256) tint) tint)
                      (Sreturn (Some (Eunop Oneg
                                       (Econst_int (Int.repr 5) tint) tint)))
                      Sskip)
                    (Ssequence
                      (Ssequence
                        (Sifthenelse (Ebinop Oeq
                                       (Etempvar _prediction_resistance tint)
                                       (Econst_int (Int.repr 1) tint) tint)
                          (Sset 159%positive (Econst_int (Int.repr 1) tint))
                          (Sset 159%positive
                            (Ecast
                              (Ebinop Ogt (Etempvar _reseed_counter tint)
                                (Etempvar _reseed_interval tint) tint) tbool)))
                        (Sifthenelse (Etempvar 159%positive tint)
                          (Ssequence
                            (Ssequence
                              (Ssequence
                                (Ssequence
                                  (Scall (Some 157%positive)
                                    (Evar _mbedtls_hmac_drbg_reseed (Tfunction
                                                                    (Tcons
                                                                    (tptr (Tstruct _mbedtls_hmac_drbg_context noattr))
                                                                    (Tcons
                                                                    (tptr tuchar)
                                                                    (Tcons
                                                                    tuint
                                                                    Tnil)))
                                                                    tint
                                                                    cc_default))
                                    ((Etempvar _ctx (tptr (Tstruct _mbedtls_hmac_drbg_context noattr))) ::
                                     (Etempvar _additional (tptr tuchar)) ::
                                     (Etempvar _add_len tuint) :: nil))
                                  (Sset 158%positive
                                    (Etempvar 157%positive tint)))
                                (Sset _ret (Etempvar 158%positive tint)))
                              (Sifthenelse (Ebinop One
                                             (Ecast
                                               (Etempvar 158%positive tint)
                                               tint)
                                             (Econst_int (Int.repr 0) tint)
                                             tint)
                                (Sreturn (Some (Etempvar _ret tint)))
                                Sskip))
                            (Sset _add_len (Econst_int (Int.repr 0) tint)))
                          Sskip))
                      (Ssequence
                        (Ssequence
                          (Sifthenelse (Ebinop One
                                         (Etempvar _additional (tptr tuchar))
                                         (Ecast
                                           (Econst_int (Int.repr 0) tint)
                                           (tptr tvoid)) tint)
                            (Sset 160%positive
                              (Ecast
                                (Ebinop One (Etempvar _add_len tuint)
                                  (Econst_int (Int.repr 0) tint) tint) tbool))
                            (Sset 160%positive
                              (Econst_int (Int.repr 0) tint)))
                          (Sifthenelse (Etempvar 160%positive tint)
                            (Scall None
                              (Evar _mbedtls_hmac_drbg_update (Tfunction
                                                                (Tcons
                                                                  (tptr (Tstruct _mbedtls_hmac_drbg_context noattr))
                                                                  (Tcons
                                                                    (tptr tuchar)
                                                                    (Tcons
                                                                    tuint
                                                                    Tnil)))
                                                                tvoid
                                                                cc_default))
                              ((Etempvar _ctx (tptr (Tstruct _mbedtls_hmac_drbg_context noattr))) ::
                               (Etempvar _additional (tptr tuchar)) ::
                               (Etempvar _add_len tuint) :: nil))
                            Sskip))
                        (Ssequence
                          (Swhile
                            (Ebinop One (Etempvar _left tuint)
                              (Econst_int (Int.repr 0) tint) tint)
                            (Ssequence
                              (Ssequence
                                (Sifthenelse (Ebinop Ogt
                                               (Etempvar _left tuint)
                                               (Etempvar _md_len tuint) tint)
                                  (Sset 161%positive
                                    (Ecast (Etempvar _md_len tuint) tuint))
                                  (Sset 161%positive
                                    (Ecast (Etempvar _left tuint) tuint)))
                                (Sset _use_len (Etempvar 161%positive tuint)))
                              (Ssequence
                                (Scall None
                                  (Evar _mbedtls_md_hmac_reset (Tfunction
                                                                 (Tcons
                                                                   (tptr (Tstruct _mbedtls_md_context_t noattr))
                                                                   Tnil) tint
                                                                 cc_default))
                                  ((Eaddrof
                                     (Efield
                                       (Ederef
                                         (Etempvar _ctx (tptr (Tstruct _mbedtls_hmac_drbg_context noattr)))
                                         (Tstruct _mbedtls_hmac_drbg_context noattr))
                                       _md_ctx
                                       (Tstruct _mbedtls_md_context_t noattr))
                                     (tptr (Tstruct _mbedtls_md_context_t noattr))) ::
                                   nil))
                                (Ssequence
                                  (Scall None
                                    (Evar _mbedtls_md_hmac_update (Tfunction
                                                                    (Tcons
                                                                    (tptr (Tstruct _mbedtls_md_context_t noattr))
                                                                    (Tcons
                                                                    (tptr tuchar)
                                                                    (Tcons
                                                                    tuint
                                                                    Tnil)))
                                                                    tint
                                                                    cc_default))
                                    ((Eaddrof
                                       (Efield
                                         (Ederef
                                           (Etempvar _ctx (tptr (Tstruct _mbedtls_hmac_drbg_context noattr)))
                                           (Tstruct _mbedtls_hmac_drbg_context noattr))
                                         _md_ctx
                                         (Tstruct _mbedtls_md_context_t noattr))
                                       (tptr (Tstruct _mbedtls_md_context_t noattr))) ::
                                     (Efield
                                       (Ederef
                                         (Etempvar _ctx (tptr (Tstruct _mbedtls_hmac_drbg_context noattr)))
                                         (Tstruct _mbedtls_hmac_drbg_context noattr))
                                       _V (tarray tuchar 32)) ::
                                     (Etempvar _md_len tuint) :: nil))
                                  (Ssequence
                                    (Scall None
                                      (Evar _mbedtls_md_hmac_finish (Tfunction
                                                                    (Tcons
                                                                    (tptr (Tstruct _mbedtls_md_context_t noattr))
                                                                    (Tcons
                                                                    (tptr tuchar)
                                                                    Tnil))
                                                                    tint
                                                                    cc_default))
                                      ((Eaddrof
                                         (Efield
                                           (Ederef
                                             (Etempvar _ctx (tptr (Tstruct _mbedtls_hmac_drbg_context noattr)))
                                             (Tstruct _mbedtls_hmac_drbg_context noattr))
                                           _md_ctx
                                           (Tstruct _mbedtls_md_context_t noattr))
                                         (tptr (Tstruct _mbedtls_md_context_t noattr))) ::
                                       (Efield
                                         (Ederef
                                           (Etempvar _ctx (tptr (Tstruct _mbedtls_hmac_drbg_context noattr)))
                                           (Tstruct _mbedtls_hmac_drbg_context noattr))
                                         _V (tarray tuchar 32)) :: nil))
                                    (Ssequence
                                      (Scall None
                                        (Evar _memcpy (Tfunction
                                                        (Tcons (tptr tvoid)
                                                          (Tcons (tptr tvoid)
                                                            (Tcons tuint
                                                              Tnil)))
                                                        (tptr tvoid)
                                                        cc_default))
                                        ((Etempvar _out (tptr tuchar)) ::
                                         (Efield
                                           (Ederef
                                             (Etempvar _ctx (tptr (Tstruct _mbedtls_hmac_drbg_context noattr)))
                                             (Tstruct _mbedtls_hmac_drbg_context noattr))
                                           _V (tarray tuchar 32)) ::
                                         (Etempvar _use_len tuint) :: nil))
                                      (Ssequence
                                        (Sset _out
                                          (Ebinop Oadd
                                            (Etempvar _out (tptr tuchar))
                                            (Etempvar _use_len tuint)
                                            (tptr tuchar)))
                                        (Sset _left
                                          (Ebinop Osub (Etempvar _left tuint)
                                            (Etempvar _use_len tuint) tuint)))))))))
                          (Ssequence
                            (Scall None
                              (Evar _mbedtls_hmac_drbg_update (Tfunction
                                                                (Tcons
                                                                  (tptr (Tstruct _mbedtls_hmac_drbg_context noattr))
                                                                  (Tcons
                                                                    (tptr tuchar)
                                                                    (Tcons
                                                                    tuint
                                                                    Tnil)))
                                                                tvoid
                                                                cc_default))
                              ((Etempvar _ctx (tptr (Tstruct _mbedtls_hmac_drbg_context noattr))) ::
                               (Etempvar _additional (tptr tuchar)) ::
                               (Etempvar _add_len tuint) :: nil))
                            (Ssequence
                              (Sset _reseed_counter
                                (Efield
                                  (Ederef
                                    (Etempvar _ctx (tptr (Tstruct _mbedtls_hmac_drbg_context noattr)))
                                    (Tstruct _mbedtls_hmac_drbg_context noattr))
                                  _reseed_counter tint))
                              (Ssequence
                                (Sassign
                                  (Efield
                                    (Ederef
                                      (Etempvar _ctx (tptr (Tstruct _mbedtls_hmac_drbg_context noattr)))
                                      (Tstruct _mbedtls_hmac_drbg_context noattr))
                                    _reseed_counter tint)
                                  (Ebinop Oadd
                                    (Etempvar _reseed_counter tint)
                                    (Econst_int (Int.repr 1) tint) tint))
                                (Sreturn (Some (Econst_int (Int.repr 0) tint)))))))))))))))))))
|}.

Definition f_mbedtls_hmac_drbg_random := {|
  fn_return := tint;
  fn_callconv := cc_default;
  fn_params := ((_p_rng, (tptr tvoid)) :: (_output, (tptr tuchar)) ::
                (_out_len, tuint) :: nil);
  fn_vars := nil;
  fn_temps := ((_ret, tint) ::
               (_ctx, (tptr (Tstruct _mbedtls_hmac_drbg_context noattr))) ::
               (162%positive, tint) :: nil);
  fn_body :=
(Ssequence
  (Sset _ctx
    (Ecast (Etempvar _p_rng (tptr tvoid))
      (tptr (Tstruct _mbedtls_hmac_drbg_context noattr))))
  (Ssequence
    (Ssequence
      (Scall (Some 162%positive)
        (Evar _mbedtls_hmac_drbg_random_with_add (Tfunction
                                                   (Tcons (tptr tvoid)
                                                     (Tcons (tptr tuchar)
                                                       (Tcons tuint
                                                         (Tcons (tptr tuchar)
                                                           (Tcons tuint Tnil)))))
                                                   tint cc_default))
        ((Etempvar _ctx (tptr (Tstruct _mbedtls_hmac_drbg_context noattr))) ::
         (Etempvar _output (tptr tuchar)) :: (Etempvar _out_len tuint) ::
         (Ecast (Econst_int (Int.repr 0) tint) (tptr tvoid)) ::
         (Econst_int (Int.repr 0) tint) :: nil))
      (Sset _ret (Etempvar 162%positive tint)))
    (Sreturn (Some (Etempvar _ret tint)))))
|}.

Definition f_mbedtls_hmac_drbg_free := {|
  fn_return := tvoid;
  fn_callconv := cc_default;
  fn_params := ((_ctx, (tptr (Tstruct _mbedtls_hmac_drbg_context noattr))) ::
                nil);
  fn_vars := nil;
  fn_temps := nil;
  fn_body :=
(Ssequence
  (Sifthenelse (Ebinop Oeq
                 (Etempvar _ctx (tptr (Tstruct _mbedtls_hmac_drbg_context noattr)))
                 (Ecast (Econst_int (Int.repr 0) tint) (tptr tvoid)) tint)
    (Sreturn None)
    Sskip)
  (Ssequence
    (Scall None
      (Evar _mbedtls_md_free (Tfunction
                               (Tcons
                                 (tptr (Tstruct _mbedtls_md_context_t noattr))
                                 Tnil) tvoid cc_default))
      ((Eaddrof
         (Efield
           (Ederef
             (Etempvar _ctx (tptr (Tstruct _mbedtls_hmac_drbg_context noattr)))
             (Tstruct _mbedtls_hmac_drbg_context noattr)) _md_ctx
           (Tstruct _mbedtls_md_context_t noattr))
         (tptr (Tstruct _mbedtls_md_context_t noattr))) :: nil))
    (Scall None
      (Evar _mbedtls_zeroize (Tfunction
                               (Tcons (tptr tvoid) (Tcons tuint Tnil)) tvoid
                               cc_default))
      ((Etempvar _ctx (tptr (Tstruct _mbedtls_hmac_drbg_context noattr))) ::
       (Esizeof (Tstruct _mbedtls_hmac_drbg_context noattr) tuint) :: nil))))
|}.

Definition f_main := {|
  fn_return := tint;
  fn_callconv := cc_default;
  fn_params := nil;
  fn_vars := nil;
  fn_temps := nil;
  fn_body :=
(Sreturn (Some (Econst_int (Int.repr 0) tint)))
|}.

Definition composites : list composite_definition :=
(Composite _mbedtls_md_context_t Struct
   ((_md_info, (tptr (Tstruct _mbedtls_md_info_t noattr))) ::
    (_md_ctx, (tptr tvoid)) :: (_hmac_ctx, (tptr tvoid)) :: nil)
   noattr ::
 Composite _mbedtls_hmac_drbg_context Struct
   ((_md_ctx, (Tstruct _mbedtls_md_context_t noattr)) ::
    (_V, (tarray tuchar 32)) :: (_reseed_counter, tint) ::
    (_entropy_len, tuint) :: (_prediction_resistance, tint) ::
    (_reseed_interval, tint) :: nil)
   noattr ::
 Composite _SHA256state_st Struct
   ((_h, (tarray tuint 8)) :: (_Nl, tuint) :: (_Nh, tuint) ::
    (_data, (tarray tuchar 64)) :: (_num, tuint) :: nil)
   noattr ::
 Composite _hmac_ctx_st Struct
   ((_md_ctx, (Tstruct _SHA256state_st noattr)) ::
    (_i_ctx, (Tstruct _SHA256state_st noattr)) ::
    (_o_ctx, (Tstruct _SHA256state_st noattr)) :: nil)
   noattr ::
 Composite _mbedtls_md_info_t Struct ((_dummy, tint) :: nil) noattr :: nil).

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
 (_memcpy,
   Gfun(External (EF_external _memcpy
                   (mksignature (AST.Tint :: AST.Tint :: AST.Tint :: nil)
                     (Some AST.Tint) cc_default))
     (Tcons (tptr tvoid) (Tcons (tptr tvoid) (Tcons tuint Tnil)))
     (tptr tvoid) cc_default)) ::
 (_memset,
   Gfun(External (EF_external _memset
                   (mksignature (AST.Tint :: AST.Tint :: AST.Tint :: nil)
                     (Some AST.Tint) cc_default))
     (Tcons (tptr tvoid) (Tcons tint (Tcons tuint Tnil))) (tptr tvoid)
     cc_default)) ::
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
 (_mocked_sha256_info, Gvar v_mocked_sha256_info) ::
 (_mbedtls_md_info_from_string, Gfun(Internal f_mbedtls_md_info_from_string)) ::
 (_mbedtls_md_info_from_type, Gfun(Internal f_mbedtls_md_info_from_type)) ::
 (_mbedtls_md_get_size, Gfun(Internal f_mbedtls_md_get_size)) ::
 (_test_md_get_size, Gfun(Internal f_test_md_get_size)) ::
 (_mbedtls_md_setup, Gfun(Internal f_mbedtls_md_setup)) ::
 (_mbedtls_md_hmac_starts, Gfun(Internal f_mbedtls_md_hmac_starts)) ::
 (_mbedtls_md_hmac_reset, Gfun(Internal f_mbedtls_md_hmac_reset)) ::
 (_mbedtls_md_hmac_update, Gfun(Internal f_mbedtls_md_hmac_update)) ::
 (_mbedtls_md_hmac_finish, Gfun(Internal f_mbedtls_md_hmac_finish)) ::
 (_mbedtls_md_free, Gfun(Internal f_mbedtls_md_free)) ::
 (_get_entropy,
   Gfun(External (EF_external _get_entropy
                   (mksignature (AST.Tint :: AST.Tint :: nil) (Some AST.Tint)
                     cc_default)) (Tcons (tptr tuchar) (Tcons tuint Tnil))
     tint cc_default)) ::
 (_mbedtls_zeroize, Gfun(Internal f_mbedtls_zeroize)) ::
 (_mbedtls_hmac_drbg_init, Gfun(Internal f_mbedtls_hmac_drbg_init)) ::
 (_mbedtls_hmac_drbg_update, Gfun(Internal f_mbedtls_hmac_drbg_update)) ::
 (_mbedtls_hmac_drbg_seed_buf, Gfun(Internal f_mbedtls_hmac_drbg_seed_buf)) ::
 (_mbedtls_hmac_drbg_reseed, Gfun(Internal f_mbedtls_hmac_drbg_reseed)) ::
 (_mbedtls_hmac_drbg_seed, Gfun(Internal f_mbedtls_hmac_drbg_seed)) ::
 (_mbedtls_hmac_drbg_set_prediction_resistance, Gfun(Internal f_mbedtls_hmac_drbg_set_prediction_resistance)) ::
 (_mbedtls_hmac_drbg_set_entropy_len, Gfun(Internal f_mbedtls_hmac_drbg_set_entropy_len)) ::
 (_mbedtls_hmac_drbg_set_reseed_interval, Gfun(Internal f_mbedtls_hmac_drbg_set_reseed_interval)) ::
 (_mbedtls_hmac_drbg_random_with_add, Gfun(Internal f_mbedtls_hmac_drbg_random_with_add)) ::
 (_mbedtls_hmac_drbg_random, Gfun(Internal f_mbedtls_hmac_drbg_random)) ::
 (_mbedtls_hmac_drbg_free, Gfun(Internal f_mbedtls_hmac_drbg_free)) ::
 (_main, Gfun(Internal f_main)) :: nil);
prog_public :=
(_main :: _mbedtls_hmac_drbg_free :: _mbedtls_hmac_drbg_random ::
 _mbedtls_hmac_drbg_random_with_add ::
 _mbedtls_hmac_drbg_set_reseed_interval ::
 _mbedtls_hmac_drbg_set_entropy_len ::
 _mbedtls_hmac_drbg_set_prediction_resistance :: _mbedtls_hmac_drbg_seed ::
 _mbedtls_hmac_drbg_reseed :: _mbedtls_hmac_drbg_seed_buf ::
 _mbedtls_hmac_drbg_update :: _mbedtls_hmac_drbg_init :: _get_entropy ::
 _mbedtls_md_free :: _mbedtls_md_hmac_finish :: _mbedtls_md_hmac_update ::
 _mbedtls_md_hmac_reset :: _mbedtls_md_hmac_starts :: _mbedtls_md_setup ::
 _test_md_get_size :: _mbedtls_md_get_size :: _mbedtls_md_info_from_type ::
 _mbedtls_md_info_from_string :: _HMAC_Final :: _HMAC_Update :: _HMAC_Init ::
 _memset :: _memcpy :: _free :: _malloc :: ___builtin_write32_reversed ::
 ___builtin_write16_reversed :: ___builtin_read32_reversed ::
 ___builtin_read16_reversed :: ___builtin_fnmsub :: ___builtin_fnmadd ::
 ___builtin_fmsub :: ___builtin_fmadd :: ___builtin_fmin ::
 ___builtin_fmax :: ___builtin_fsqrt :: ___builtin_ctz :: ___builtin_clz ::
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

