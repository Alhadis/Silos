Require Import floyd.proofauto.
Import ListNotations.
Local Open Scope logic.

Require Import hmac_drbg.
Require Import spec_hmac_drbg.
Require Import HMAC_DRBG_update.
Require Import sha.HMAC256_functional_prog.
Require Import sha.spec_sha.

Fixpoint HMAC_DRBG_update_round (HMAC: list Z -> list Z -> list Z) (provided_data K V: list Z) (round: nat): (list Z * list Z) :=
  match round with
    | O => (K, V)
    | S round' =>
      let (K, V) := HMAC_DRBG_update_round HMAC provided_data K V round' in
      let K := HMAC (V ++ [Z.of_nat round'] ++ provided_data) K in
      let V := HMAC V K in
      (K, V)
  end.

Definition HMAC_DRBG_update_concrete (HMAC: list Z -> list Z -> list Z) (provided_data K V: list Z): (list Z * list Z) :=
  let rounds := match provided_data with
                  | [] => 1%nat
                  | _ => 2%nat
                end in
  HMAC_DRBG_update_round HMAC provided_data K V rounds.

Theorem HMAC_DRBG_update_concrete_correct:
  forall HMAC provided_data K V, HMAC_DRBG_update HMAC provided_data K V = HMAC_DRBG_update_concrete HMAC provided_data K V.
Proof.
  intros.
  destruct provided_data; reflexivity.
Qed.

Definition update_rounds (non_empty_additional: bool): Z :=
  if non_empty_additional then 2 else 1.

Lemma HMAC_DRBG_update_round_incremental:
  forall key V initial_state_abs contents n,
    (key, V) = HMAC_DRBG_update_round HMAC256 contents
                           (hmac256drbgabs_key initial_state_abs)
                           (hmac256drbgabs_value initial_state_abs) n ->
    (HMAC256 (V ++ (Z.of_nat n) :: contents) key,
     HMAC256 V (HMAC256 (V ++ (Z.of_nat n) :: contents) key)) =
    HMAC_DRBG_update_round HMAC256 contents
                           (hmac256drbgabs_key initial_state_abs)
                           (hmac256drbgabs_value initial_state_abs) (n + 1).
Proof.
  intros.
  rewrite plus_comm.
  simpl.
  rewrite <- H.
  reflexivity.
Qed.

Lemma HMAC_DRBG_update_round_incremental_Z:
  forall key V initial_state_abs contents i,
    0 <= i ->
    (key, V) = HMAC_DRBG_update_round HMAC256 contents
                           (hmac256drbgabs_key initial_state_abs)
                           (hmac256drbgabs_value initial_state_abs) (Z.to_nat i) ->
    (HMAC256 (V ++ i :: contents) key,
     HMAC256 V (HMAC256 (V ++ i :: contents) key)) =
    HMAC_DRBG_update_round HMAC256 contents
                           (hmac256drbgabs_key initial_state_abs)
                           (hmac256drbgabs_value initial_state_abs) (Z.to_nat (i + 1)).
Proof.
  intros.
  rewrite <- (Z2Nat.id i) at 1 2 by assumption.
  rewrite Z2Nat.inj_add by (try assumption; try omega).
  simpl.
  apply HMAC_DRBG_update_round_incremental; assumption.
Qed.

Lemma body_hmac_drbg_update: semax_body HmacDrbgVarSpecs HmacDrbgFunSpecs 
       f_mbedtls_hmac_drbg_update hmac_drbg_update_spec.
Proof.
  start_function.
  name ctx' _ctx.
  name add_len' _add_len.
  name additional' _additional.
  rename lvar0 into sep.
  rename lvar1 into K.

  (* info = md_ctx.md_info *)
  forward.

  (* md_len = mbedtls_md_get_size( info ); *)
  forward_call tt.

  Intros md_len.

  (* rounds = ( additional != NULL && add_len != 0 ) ? 2 : 1; *)
  remember (if eq_dec add_len 0 then false else if eq_dec additional nullval then false else true) as non_empty_additional.
  forward_if (
      PROP  ()
      LOCAL  (temp _md_len md_len; lvar _K (tarray tuchar 32) K;
      temp _ctx ctx;
      lvar _sep (tarray tuchar 1) sep;
      temp _additional additional; temp _add_len (Vint (Int.repr add_len));
      temp 140%positive (Val.of_bool non_empty_additional);
      gvar sha._K256 kv
             )
      SEP  ((data_at_ Tsh (tarray tuchar 32) K);
      (data_at_ Tsh (tarray tuchar 1) sep);
      (data_at Tsh (tarray tuchar add_len)
          (map Vint (map Int.repr contents)) additional);
      (data_at Tsh t_struct_hmac256drbg_context_st initial_state ctx);
      (hmac256drbg_relate initial_state_abs initial_state);
      (data_at Tsh t_struct_mbedtls_md_info info_contents
          (hmac256drbgstate_md_info_pointer initial_state));
      (K_vector kv)
       )
    ).
  {
    (* show that add_len <> 0 implies the post condition *)
    forward.
    {
      entailer!.
      assert (sizeof cenv_cs (tarray tuchar (Zlength contents)) > 0).
      {
        simpl.
        destruct contents.
        assert (contra: False) by (apply H5; reflexivity); inversion contra.
        clear.
        repeat rewrite Zlength_map. rewrite Zlength_cons.
        assert (0 <= Zlength contents) by (apply Zlength_nonneg).
        destruct (Zlength contents).
        simpl; omega.
        hnf; auto.
        assert (contra: False) by (apply H; reflexivity); inversion contra.
      }
      apply denote_tc_comparable_split; auto 50 with valid_pointer.
      (* TODO regressoin, this should have solved it *) 
      (*
      apply sepcon_valid_pointer1.
      apply sepcon_valid_pointer1.
      apply sepcon_valid_pointer1.
      apply sepcon_valid_pointer1.
      apply sepcon_valid_pointer1.
      apply sepcon_valid_pointer2.
      apply data_at_valid_ptr; auto. *)
    }
    entailer!.
    repeat rewrite Zlength_map in *.
    destruct (eq_dec (Zlength contents) 0) as [zlength_eq | zlength_neq].
    assert (contra: False) by (apply H5; apply zlength_eq); inversion contra.
    destruct additional'; try solve [inversion TC1]. 
    {
      inv TC1.
      destruct (eq_dec (Vint Int.zero) nullval) as [additional_eq | additional_neq].
      auto.
      assert (contra: False) by (apply additional_neq; reflexivity); inversion contra.
    }
    {
      destruct (eq_dec (Vptr b i) nullval) as [additional_eq | additional_neq].
      inversion additional_eq.
      auto.
    }
  }

  {
    (* show that add_len = 0 implies the post condition *)
    forward.
    entailer!. rewrite H5.
    auto.
  }

  remember (update_rounds non_empty_additional) as rounds. unfold update_rounds in Heqrounds.
  
  forward_if (
      PROP  ()
      LOCAL  (temp _md_len md_len; lvar _K (tarray tuchar 32) K;
      temp _ctx ctx;
      lvar _sep (tarray tuchar 1) sep;
      temp _additional additional; temp _add_len (Vint (Int.repr add_len));
      temp 141%positive (Vint (Int.repr rounds));
      gvar sha._K256 kv
             )
      SEP  ((data_at_ Tsh (tarray tuchar 32) K);
      (data_at_ Tsh (tarray tuchar 1) sep);
      (data_at Tsh (tarray tuchar add_len)
          (map Vint (map Int.repr contents)) additional);
      (data_at Tsh t_struct_hmac256drbg_context_st initial_state ctx);
      (hmac256drbg_relate initial_state_abs initial_state);
      (data_at Tsh t_struct_mbedtls_md_info info_contents
                (hmac256drbgstate_md_info_pointer initial_state)); 
      (K_vector kv)
      )
  ).
  {
    (* non_empty_additional = true *)
    forward.
    entailer!.
  }
  {
    (* non_empty_additional = false *)
    forward.
    entailer!.
  }
  forward.

  remember (hmac256drbgabs_key initial_state_abs) as initial_key.
  remember (hmac256drbgabs_value initial_state_abs) as initial_value.
  (* verif_sha_final2.v, @exp (environ -> mpred) *)
  (* for ( sep_value = 0; sep_value < rounds; sep_value++ ) *)
  Time forward_for_simple_bound rounds (
                              EX i: Z,
      PROP  (
      (* (key, value) = HMAC_DRBG_update_round HMAC256 (map Int.signed contents) old_key old_value 0 (Z.to_nat i);
      (*
      le i (update_rounds non_empty_additional);
       *)
      key = hmac256drbgabs_key final_state_abs;
      value = hmac256drbgabs_value final_state_abs;
      hmac256drbgabs_metadata_same final_state_abs state_abs *)
        ) 
      LOCAL (
       temp _md_len md_len;
       temp _ctx ctx;
       lvar _K (tarray tuchar 32) K; lvar _sep (tarray tuchar 1) sep;
       temp _additional additional; temp _add_len (Vint (Int.repr add_len));
       gvar sha._K256 kv
         )
      SEP  (
        (EX key: list Z, EX value: list Z, EX final_state_abs: hmac256drbgabs,
          !!(
              (key, value) = HMAC_DRBG_update_round HMAC256 contents initial_key initial_value (Z.to_nat i)
              /\ key = hmac256drbgabs_key final_state_abs
              /\ value = hmac256drbgabs_value final_state_abs
              /\ hmac256drbgabs_metadata_same final_state_abs initial_state_abs
              /\ Zlength value = Z.of_nat SHA256.DigestLength
              /\ Forall general_lemmas.isbyteZ value
            ) &&
           (hmac_drbg_update_post final_state_abs initial_state ctx info_contents)
         );
        (* `(update_relate_final_state ctx final_state_abs); *)
        (data_at_ Tsh (tarray tuchar 32) K);
        (data_at Tsh (tarray tuchar add_len) (map Vint (map Int.repr contents)) additional);
        (data_at_ Tsh (tarray tuchar 1) sep );
        (K_vector kv)
         )
  ). (* 2 *)
  {
    (* Int.min_signed <= 0 <= rounds *)
    rewrite Heqrounds; destruct non_empty_additional; auto.
  }
  {
    (* rounds <= Int.max_signed *)
    rewrite Heqrounds; destruct non_empty_additional; auto.
  }
  {
    (* pre conditions imply loop invariant *)
    unfold hmac_drbg_update_post.
    Exists (hmac256drbgabs_key initial_state_abs) (hmac256drbgabs_value initial_state_abs) initial_state_abs.
    destruct initial_state_abs.
    destruct initial_state as [md_ctx0' [V0' [reseed_counter0' [entropy_len0' [prediction_resistance0' reseed_interval0']]]]].
    unfold hmac256drbgabs_to_state.
    entailer!.
  }
  {
    (* loop body *)
    change (`(eq (Vint (Int.repr rounds))) (eval_expr (Etempvar _rounds tint))) with (temp _rounds (Vint (Int.repr rounds))).
    unfold hmac_drbg_update_post. unfold hmac256drbgabs_to_state.
    Intros key value state_abs.
    unfold_data_at 1%nat.
    rewrite (field_at_data_at _ _ [StructField _md_ctx]); simpl.
    rewrite (field_at_data_at _ _ [StructField _V]); simpl.

    assert (Hfield_md_ctx: forall ctx', isptr ctx' -> field_compatible t_struct_hmac256drbg_context_st [StructField _md_ctx] ctx' -> ctx' = field_address t_struct_hmac256drbg_context_st [StructField _md_ctx] ctx').
    {
      intros ctx'' Hisptr Hfc.
      unfold field_address.
      destruct (field_compatible_dec t_struct_hmac256drbg_context_st); [|contradiction].
      simpl. change (Int.repr 0) with Int.zero. rewrite offset_val_force_ptr.
      destruct ctx''; inversion Hisptr. reflexivity.
    }
    assert (Hfield_V: forall ctx', isptr ctx' -> field_compatible t_struct_hmac256drbg_context_st [StructField _V] ctx' -> offset_val (Int.repr 12) ctx' = field_address t_struct_hmac256drbg_context_st [StructField _V] ctx').
    {
      intros ctx'' Hisptr Hfc.
      unfold field_address.
      destruct (field_compatible_dec t_struct_hmac256drbg_context_st); [reflexivity|contradiction].
    }
    destruct state_abs.
    destruct initial_state as [md_ctx [V' [reseed_counter' [entropy_len' [prediction_resistance' reseed_interval']]]]]. simpl in H7; subst key0.
    unfold hmac256drbg_relate. unfold md_full.
    Intros.
    simpl in H8.
    subst value.
    assert (Hmdlen_V: md_len = Vint (Int.repr (Zlength V))) by (subst md_len; rewrite H10; reflexivity).

    (* sep[0] = sep_value; *)
    forward.

    (* mbedtls_md_hmac_reset( &ctx->md_ctx ); *)
    Time forward_call (field_address t_struct_hmac256drbg_context_st [StructField _md_ctx] ctx, md_ctx, key, kv). (* 79 *)
    {
      entailer!.
    }
    Intros v; subst v.

    (* mbedtls_md_hmac_update( &ctx->md_ctx, ctx->V, md_len ); *)
    Time forward_call (key, field_address t_struct_hmac256drbg_context_st [StructField _md_ctx] ctx, md_ctx, field_address t_struct_hmac256drbg_context_st [StructField _V] ctx, @nil Z, V, kv). (* 83 *)
    {
      entailer!.
      rewrite H10; reflexivity.
    }
    {
      rewrite H10.
      change (Z.of_nat SHA256.DigestLength) with 32.
      cancel.
    }
    {
      rewrite H10.
      idtac.
      repeat split; [hnf;auto | hnf;auto | assumption].
    }
    Intros v; subst v.
      
    unfold upd_Znth.
    unfold sublist. simpl.
    assert (Hiuchar: Int.zero_ext 8 (Int.repr i) = Int.repr i).
    {
      clear - H5 Heqrounds. destruct non_empty_additional; subst;
      apply zero_ext_inrange;
      rewrite hmac_pure_lemmas.unsigned_repr_isbyte by (hnf; omega); simpl; omega.
    }
    rewrite Hiuchar.

    (* mbedtls_md_hmac_update( &ctx->md_ctx, sep, 1 ); *)
    Time forward_call (key, field_address t_struct_hmac256drbg_context_st [StructField _md_ctx] ctx, md_ctx, sep, V, [i], kv). (* 62 *)
    {
      entailer!.
    }
    {
      (* prove the PROP clauses *)
      rewrite H10.
      change (Zlength [i]) with 1.
      repeat split; [hnf;auto | hnf;auto | ].
      unfold general_lemmas.isbyteZ.
      repeat constructor.
      omega.
      destruct non_empty_additional; subst rounds; omega.
    }
    Intros v; subst v.
      
    (* if( rounds == 2 ) *)
    Time forward_if (
      PROP  ()
      LOCAL  (temp _sep_value (Vint (Int.repr i));
      temp _rounds (Vint (Int.repr rounds)); temp _md_len md_len;
      temp _ctx ctx; lvar _K (tarray tuchar (Zlength V)) K;
      lvar _sep (tarray tuchar 1) sep; temp _additional additional;
      temp _add_len (Vint (Int.repr add_len)); gvar sha._K256 kv)
      SEP  ((md_relate (hABS key (V ++ [i] ++ contents)) md_ctx);
      (data_at Tsh t_struct_md_ctx_st md_ctx
          (field_address t_struct_hmac256drbg_context_st
             [StructField _md_ctx] ctx));
      (data_at Tsh (tarray tuchar (Zlength [i])) [Vint (Int.repr i)] sep);
      (K_vector kv);
      (data_at Tsh (tarray tuchar (Zlength V)) (map Vint (map Int.repr V))
          (field_address t_struct_hmac256drbg_context_st [StructField _V] ctx));
      (field_at Tsh t_struct_hmac256drbg_context_st
          [StructField _reseed_counter] (Vint (Int.repr reseed_counter)) ctx);
      (field_at Tsh t_struct_hmac256drbg_context_st
          [StructField _entropy_len] (Vint (Int.repr entropy_len)) ctx);
      (field_at Tsh t_struct_hmac256drbg_context_st
          [StructField _prediction_resistance] (Val.of_bool prediction_resistance) ctx);
      (field_at Tsh t_struct_hmac256drbg_context_st
          [StructField _reseed_interval] (Vint (Int.repr reseed_interval))
          ctx);
      (data_at Tsh t_struct_mbedtls_md_info info_contents
          (hmac256drbgstate_md_info_pointer
             (md_ctx,
         (V',
         (reseed_counter',
         (entropy_len', (Val.of_bool prediction_resistance, reseed_interval')))))));
      (data_at_ Tsh (tarray tuchar (Zlength V)) K);
      (data_at Tsh (tarray tuchar (Zlength contents))
          (map Vint (map Int.repr contents)) additional)) 
    ). (* 42 *)
    {
      
      (* rounds = 2 case *)
      rewrite H1.

      (* mbedtls_md_hmac_update( &ctx->md_ctx, additional, add_len ); *)
      Time forward_call (key, field_address t_struct_hmac256drbg_context_st [StructField _md_ctx] ctx, md_ctx, additional, V ++ [i], contents, kv). (* 63 *)
      {
        (* prove the parameters match up *)
        entailer!.
      }
      {
        (* prove the PROP clause matches *)
        rewrite H1 in *. repeat split; [omega | omega | | assumption].
        rewrite Zlength_app; rewrite H10.
        simpl. remember (Zlength contents) as n; clear - H.
        destruct H. rewrite <- Zplus_assoc.
        unfold Int.max_unsigned in H0.
        rewrite hmac_pure_lemmas.IntModulus32 in H0; rewrite two_power_pos_equiv.
        simpl. simpl in H0.
        assert (H1: Z.pow_pos 2 61 = 2305843009213693952) by reflexivity; rewrite H1; clear H1.
        omega.
      }
      (* prove the post condition of the if statement *)
      rewrite <- app_assoc.
      Intros v.
      rewrite H10.
      entailer!.
    }
    {
      (* rounds <> 2 case *)
      forward.
      rewrite H10.
      entailer!.
      destruct contents.
      entailer!.

      (* contents not empty, which is a contradiction *)
      rewrite Zlength_cons in H7.
      destruct (eq_dec (Z.succ (Zlength contents)) 0) as [Zlength_eq | Zlength_neq].
      assert (0 <= Zlength contents) by (apply Zlength_nonneg).
      destruct (Zlength contents); [inversion Zlength_eq| omega | omega].

      assert (Hisptr: isptr additional') by auto.
      destruct (eq_dec additional' nullval) as [additional_null | additional_not_null].
      subst. inversion Hisptr.
      assert (contra: False) by (apply H7; reflexivity); inversion contra.
    }
    rewrite H10.

    (* mbedtls_md_hmac_finish( &ctx->md_ctx, K ); *)
    rewrite data_at__memory_block. change (sizeof cenv_cs (tarray tuchar 32)) with 32.
    Intros.
    Time forward_call ((V ++ [i] ++ contents), key, field_address t_struct_hmac256drbg_context_st [StructField _md_ctx] ctx, md_ctx, K, Tsh, kv). (* 62 *)
    {
      (* prove the parameters match up *)
      entailer!.
    }
    {
      change (sizeof cenv_cs (tarray tuchar (Z.of_nat SHA256.DigestLength))) with 32.
      cancel.
    }
    Intros new_key.

    assert_PROP (isptr K) as HisptrK by entailer!. 
    destruct K; try solve [inversion HisptrK].
    replace_SEP 1 (UNDER_SPEC.EMPTY (snd (snd md_ctx))) by (entailer!; apply UNDER_SPEC.FULL_EMPTY).

    (* mbedtls_md_hmac_starts( &ctx->md_ctx, K, md_len ); *)
    Time forward_call (field_address t_struct_hmac256drbg_context_st [StructField _md_ctx] ctx, md_ctx, (Zlength (HMAC256 (V ++ [i] ++ contents) key)), HMAC256 (V ++ [i] ++ contents) key, kv, b, i0). (* 75 *)
    {
      (* prove the function parameters match up *)
      entailer!. rewrite hmac_common_lemmas.HMAC_Zlength. reflexivity.
    }
    {
      split.
      {
        (* prove that output of HMAC can serve as its key *)
        unfold spec_hmacNK.has_lengthK; simpl.
        repeat split; try reflexivity; rewrite hmac_common_lemmas.HMAC_Zlength;
        hnf; auto.
      }
      {
        (* prove that the output of HMAC are bytes *)
        apply hmac_common_lemmas.isbyte_hmac.
      }
    }
    Intros v; subst v.

    (* mbedtls_md_hmac_update( &ctx->md_ctx, ctx->V, md_len ); *)
    Time forward_call (HMAC256 (V ++ [i] ++ contents) key, field_address t_struct_hmac256drbg_context_st [StructField _md_ctx] ctx, md_ctx, field_address t_struct_hmac256drbg_context_st [StructField _V] ctx, @nil Z, V, kv). (* 72 *)
    {
      (* prove the function parameters match up *)
      entailer!. rewrite H10; reflexivity.
    }
    {
      (* prove the function SEP clauses match up *)
      rewrite H10; cancel.
    }
    {
      (* prove the PROP clauses *)
      rewrite H10.
      repeat split; [hnf;auto | hnf;auto | assumption].
    }
    Intros v; subst v.
    rewrite H10.
    normalize.
    replace_SEP 2 (memory_block Tsh (sizeof cenv_cs (tarray tuchar 32)) (field_address t_struct_hmac256drbg_context_st [StructField _V] ctx)) by (entailer!; apply data_at_memory_block).
    simpl.
    (* mbedtls_md_hmac_finish( &ctx->md_ctx, ctx->V ); *)
    Time forward_call (V, HMAC256 (V ++ i::contents) key, field_address t_struct_hmac256drbg_context_st [StructField _md_ctx] ctx, md_ctx, field_address t_struct_hmac256drbg_context_st [StructField _V] ctx, Tsh, kv). (* 75 *)
    {
      (* prove the function parameters match up *)
      entailer!.
    }
    Intros new_V.
    unfold hmac_drbg_update_post, hmac256drbgabs_to_state.
    Exists (HMAC256 (V ++ [i] ++ contents) key) (HMAC256 V (HMAC256 (V ++ [i] ++ contents) key))    (HMAC256DRBGabs (HMAC256 (V ++ [i] ++ contents) key) (HMAC256 V (HMAC256 (V ++ [i] ++ contents) key)) reseed_counter entropy_len prediction_resistance reseed_interval).
    Time entailer!. (* 335 ! *)
    {
      split; [| apply hmac_common_lemmas.HMAC_Zlength].
      (* prove that the new key and value is what we expect *)
      clear - H5 H6; destruct H5; simpl in H6.
      apply HMAC_DRBG_update_round_incremental_Z; assumption.
    }
    unfold hmac256drbgstate_md_FULL.
    unfold_data_at 4%nat.
    unfold hmac256drbg_relate;
    rewrite (field_at_data_at _ _ [StructField _md_ctx]);
    rewrite (field_at_data_at _ _ [StructField _V]); simpl.
    repeat rewrite hmac_common_lemmas.HMAC_Zlength.
    unfold md_full.
    Time entailer!. (* 15 *)
  }
  (* return *)
  forward.

  (* prove function post condition *)
  Exists K sep.
  unfold hmac256drbgabs_hmac_drbg_update.
  unfold HMAC256_DRBG_functional_prog.HMAC256_DRBG_update.
  destruct initial_state_abs.
  rewrite HMAC_DRBG_update_concrete_correct.
  Time entailer!. (* 29 *)
  {
    (*
    rename H1 into Hupdate_rounds.
    rename H6 into Hmetadata.
    destruct final_state_abs; unfold hmac256drbgabs_metadata_same in Hmetadata.
    destruct Hmetadata as [Hreseed_counter [Hentropy_len [Hpr Hrseed_interval]]]; subst.
*)
    destruct contents; unfold HMAC_DRBG_update_concrete;
    simpl;
    split; try apply hmac_common_lemmas.HMAC_Zlength; try apply hmac_common_lemmas.isbyte_hmac.
  }
  rename H1 into Hupdate_rounds.
  rename H6 into Hmetadata.
  destruct final_state_abs; unfold hmac256drbgabs_metadata_same in Hmetadata.
  destruct Hmetadata as [Hreseed_counter [Hentropy_len [Hpr Hrseed_interval]]]; subst.
  replace (HMAC_DRBG_update_concrete HMAC256 contents key V) with (key0, V0).
  cancel.
  unfold hmac256drbgabs_key, hmac256drbgabs_value in Hupdate_rounds.
  rewrite Hupdate_rounds. unfold HMAC_DRBG_update_concrete.
  replace (Z.to_nat
        (if if eq_dec (Zlength contents) 0
            then false
            else if eq_dec additional' nullval then false else true
         then 2
         else 1)) with (match contents with | [] => 1%nat | _ => 2%nat end).
  reflexivity.
  destruct contents.
  {
    reflexivity.
  }
  {
    destruct (eq_dec (Zlength (z :: contents)) 0) as [Zlength_eq | Zlength_neq].
    rewrite Zlength_cons, Zlength_correct in Zlength_eq; omega.
    destruct (eq_dec additional' nullval) as [additional_eq | additional_neq].
    subst. repeat rewrite Zlength_map in H10; inversion H10 as [isptr_null H']; inversion isptr_null.
    reflexivity.
  }
Time Qed. (* 1018 !!! *)