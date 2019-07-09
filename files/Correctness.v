Require Import Gc.Language Gc.Gc Gc.Safety Gc.Util.
Require Import Equality CpdtTactics.

Ltac cleanup :=
  repeat match goal with
         | [ H: ?A = ?A |- _ ] => clear H
         end.

Ltac cleanjection :=
  repeat match goal with
         | [H: Some ?A = Some ?B |- _] => (injection H ; clear H ; intro ; subst)
         | [H: (_, _) = (_, _) |- _] =>  (injection H ; clear H ; intro ; subst)
         end.


Ltac obv_eq' ed A :=
  let ph := fresh "H" in
  destruct (ed A A) as [_ | ph]; try solve [(contradiction ph ; reflexivity)].

Ltac obv_eq :=
  match goal with
  | [ H : context [ptr_eq_dec ?A ?A] |- _] => obv_eq' ptr_eq_dec A
  | [ H : context [var_eq_dec ?A ?A] |- _] => obv_eq' var_eq_dec A
  | [ |- context [ptr_eq_dec ?A ?A] ] => obv_eq' ptr_eq_dec A
  | [ |- context [var_eq_dec ?A ?A] ] => obv_eq' var_eq_dec A
  end.

Ltac splitto :=
  repeat match goal with
         | [ |- _ /\ _ ] => split
         end.

Lemma eval_valexp_safety_int :
  forall s1 s2 v n,
    equiv s1 s2 ->
    eval_valexp (roots s1) (heap s1) v = Some (Int n) ->
    eval_valexp (roots s2) (heap s2) v = Some (Int n).
Proof.
  intros.
  unfold eval_valexp in *.
  destruct v. crush.
  unfold equiv in H.
  destructo.
  unfold equiv' in H1.

  destruct (roots_get v (roots s1)) eqn:? ;
    destruct (roots_get v (roots s2)) eqn:? ;
    try discriminate ;
    unfold heap_get in H0 ;
    destruct (heap_get_struct p (heap s1)) eqn:? ;
    try discriminate ;
    specialize (H1 v p TermStr p l) ;
    assert (roots_maps (roots s1) v p) ;
    try (eapply roots_get_maps) ;
    eauto ;
    assert (addresses (heap s1) p TermStr p) ;
    try (constructor ;
         exists l;
         auto
        );
    intuition;
    destructo.
  * inversion H5. subst.
    specialize (roots_get_maps _ _ _ Heqo0). intros.
    assert (p0 = x0). eapply roots_maps_uniq ; eauto.
    subst.
    destructo.
    assert (List.nth_error x1 n0 = Some (Int n)).
    unfold struct_equiv in H7.
    destructo.
    specialize (H10 n0 n).
    destructo.
    intuition.

    unfold heap_get.
    rewrite H6.
    auto.
  * specialize (roots_maps_get _ _ _ H1).
    intros.
    crush.
Qed.

Lemma eval_valexp_safety_any :
  forall s1 s2 v val1,
    equiv s1 s2 ->
    eval_valexp (roots s1) (heap s1) v = Some val1 ->
    exists val2, eval_valexp (roots s2) (heap s2) v = Some val2.
Proof.
  intros.
  destruct H. destructo.
  unfold eval_valexp in *.
  destruct v.
  eauto.
  destruct (roots_get v (roots s1)) eqn:?.
  Focus 2. discriminate.
  destruct (roots_get v (roots s2)) eqn:?.
  * destruct (heap_get p0 n (heap s2)) eqn:?.
    eauto.
    unfold heap_get in H0.
    destruct (heap_get_struct p (heap s1)) eqn:?.
    Focus 2. discriminate.
    specialize (H1 v p TermStr p l).

    specialize (roots_get_maps _ _ _ Heqo). intros.
    assert (addresses (heap s1) p TermStr p). constructor ; eauto.
    assert (heap_maps_struct (heap s1) p l). eauto.

    intuition.
    destructo.
    specialize (roots_get_maps _ _ _ Heqo0). intros.
    specialize (roots_maps_uniq _ _ _ _ H1 H9). intros. subst.
    inversion H6. subst.
    destructo.
    unfold heap_get in Heqo1.
    rewrite H7 in Heqo1.
    unfold struct_equiv in H8. destructo.
    assert (length x1 <> length l).
    specialize (List.nth_error_None x1 n).
    specialize (List.nth_error_Some l n).
    intros.
    destructo.
    intuition.
    assert (List.nth_error l n = None -> False). intros.
    rewrite H14 in H0. discriminate.
    intuition.
    crush.
  * unfold heap_get in H0.
    destruct (heap_get_struct p (heap s1)) eqn:?.
    Focus 2. discriminate.
    specialize (H1 v p TermStr p l).

    specialize (roots_get_maps _ _ _ Heqo). intros.
    assert (addresses (heap s1) p TermStr p). constructor ; eauto.
    assert (heap_maps_struct (heap s1) p l). eauto.

    intuition.
    destructo.
    specialize (roots_maps_get _ _ _ H1).
    intros.
    crush.
Qed.

Lemma option_eval_safe :
  forall s1 s2 v val1,
    equiv s1 s2 ->
    option_eval (roots s1) (heap s1) v = Some val1 ->
    exists val2, option_eval (roots s2) (heap s2) v = Some val2.
Proof.
  induction v. eauto.
  intros.
  unfold option_eval in * ; fold option_eval in *.
  destruct (eval_valexp (roots s1) (heap s1) a) eqn:?.
  Focus 2. discriminate.
  destruct (option_eval (roots s1) (heap s1) v) eqn:?.
  Focus 2. discriminate.
  crush.
  specialize (IHv l H).
  intuition.
  destructo.
  rewrite H0.
  destruct (eval_valexp (roots s2) (heap s2) a) eqn:?.
  eauto.
  specialize (eval_valexp_safety_any _ _ _ _ H Heqo).
  crush.
Qed.

Theorem equiv_class_step_1 :
  forall s1 s2 c s1',
    handle_small_step s1 c = Some s1' ->
    equiv s1 s2 ->
    exists s2',
      handle_small_step s2 c = Some s2'.
Proof.
  intros.
  destruct c ; unfold handle_small_step in *.
  * induction l. crush. eauto.
    unfold option_eval in * ; fold option_eval in *.
    destruct (eval_valexp (roots s1) (heap s1) a) eqn:?.
    Focus 2. discriminate.
    destruct (eval_valexp (roots s2) (heap s2) a) eqn:?.
    Focus 2. specialize (eval_valexp_safety_any _ _ _ _ H0 Heqo). intros.
    destructo. crush.
    destruct (option_eval (roots s1) (heap s1) l) eqn:?.
    Focus 2. discriminate.
    specialize (option_eval_safe _ _ _ _ H0 Heqo1).
    intros.
    destructo.
    rewrite H1.
    eauto.
  * destruct (eval_valexp (roots s1) (heap s1) v0) eqn:?.
    Focus 2. discriminate.
    specialize (eval_valexp_safety_any _ _ _ _ H0 Heqo).
    intros.
    destructo.
    rewrite H1.
    edestruct (update_heap (roots s2) (heap s2) v n x) eqn:?.
    eauto.
    unfold update_heap in Heqo0.
    destruct (roots_get v (roots s2)) eqn:?.
    - destruct (heap_set_k (heap s2) p n x) eqn:?. discriminate.
      clear Heqo0.
      destruct (update_heap (roots s1) (heap s1) v n v1) eqn:?.
      Focus 2. discriminate.
      subst.
      unfold update_heap in Heqo0.
      destruct (roots_get v (roots s1)) eqn:?.
      Focus 2. discriminate.
      destruct (heap_set_k (heap s1) p0 n v1) eqn:?.
      Focus 2. discriminate.
      crush.

      destruct H0.
      destructo.
      specialize (heap_sets_implies_exists_heap_maps_struct _ _ _ _ _ Heqo4).
      intros.
      destructo.
      specialize (H0 v p0 TermStr p0 x0).

      assert (roots_maps (roots s1) v p0). eapply roots_get_maps. auto.
      assert (addresses (heap s1) p0 TermStr p0). constructor. eauto.

      intuition.
      destructo.
      assert (p = x1).
      specialize (roots_get_maps _ _ _ Heqo1). intros.
      specialize (roots_maps_uniq _ _ _ _ H9 H0). auto.
      subst.
      inversion H6. subst.
      destructo.
      unfold struct_equiv in H8.
      destructo.
      specialize (heap_set_fails_implies_no_exists_heap_maps_struct _ _ _ _ Heqo2).
      intros.
      contradiction H11.
      exists x3. auto.
    - contradict Heqo1. unfold not. intros.
      clear Heqo0.
      destruct (update_heap (roots s1) (heap s1) v n v1) eqn:?.
      Focus 2. discriminate.
      unfold update_heap in Heqo0.
      destruct (roots_get v (roots s1)) eqn:?.
      Focus 2. discriminate.
      destruct (heap_set_k (heap s1) p n v1) eqn:?.
      Focus 2. discriminate.
      destruct H0. destructo.
      destruct H0.
      destructo.
      crush.
      specialize (heap_sets_implies_exists_heap_maps_struct _ _ _ _ _ Heqo2).
      intros.
      destructo.
      specialize (H3 v p TermStr p x0).

      assert (roots_maps (roots s1) v p). eapply roots_get_maps. auto.
      assert (addresses (heap s1) p TermStr p). constructor. eauto.

      intuition.
      destructo.
      specialize (roots_maps_get _ _ _ H3).
      intros.
      crush.
  * destruct (eval_valexp (roots s1) (heap s1) v0) eqn:?.
    Focus 2. discriminate.
    destruct v1 eqn:?.
    discriminate.
    crush.
    destruct (eval_valexp (roots s2) (heap s2) v0) eqn:?.
    Focus 2.
    specialize (eval_valexp_safety_any _ _ _ _ H0 Heqo).
    intros. destructo. crush.

    destruct v1.
    assert (equiv s2 s1). eapply equiv_symm ; eauto.
    specialize (eval_valexp_safety_int _ _ _ _ H Heqo0).
    intros. crush.
    eauto.
  * unfold handle_small_step in *.
    eexists.
    eauto.
  * unfold handle_small_step in *.
    edestruct eval_valexp eqn:?.
    Focus 2. discriminate.
    destruct v0 eqn:?.
    Focus 2. discriminate.
    specialize (eval_valexp_safety_int _ _ _ _ H0 Heqo). intros.
    rewrite H1.
    eauto.
Qed.

Lemma equiv_single_step :
  forall v1 p v0 p0 p1 s1 s2 p1' struct1 address,
  eval_valexp (roots s1) (heap s1) v0 = Some (Pointer p) ->
  eval_valexp (roots s2) (heap s2) v0 = Some (Pointer p0) ->
  equiv' s1 s2 ->
  roots_maps (roots_set (roots s1) v1 p) v1 p1 ->
  addresses (heap s1) p1 address p1' ->
  heap_maps_struct (heap s1) p1' struct1 ->
  exists (p2 p2' : ptr) (struct2 : list val),
    roots_maps (roots_set (roots s2) v1 p0) v1 p2 /\
    addresses (heap s2) p2 address p2' /\
    heap_maps_struct (heap s2) p2' struct2 /\
    struct_equiv struct1 struct2.
Proof.
  intros.
  specialize (roots_set_1 _ _ _ _ H2).
  intros.
  subst.
  destruct v0. crush.

  unfold eval_valexp in H.
  destruct (roots_get v (roots s1)) eqn:?.
  Focus 2. discriminate.

  unfold equiv' in H1.

  specialize (H1 v p (FollowStr n address) p1' struct1).
  specialize (roots_get_maps _ _ _ Heqo).
  intros.

  assert (addresses (heap s1) p (FollowStr n address) p1').
  eapply FollowAddresses.
  unfold heap_get in H.
  destruct (heap_get_struct p (heap s1)) eqn:?.
  Focus 2. discriminate.
  eapply heap_get_implies_heap_maps ; eauto.
  auto.

  intuition.
  destructo.

  exists p0.
  exists x0.
  exists x1.
  split. eapply roots_set_2.
  split.
  Focus 2. crush.
  inversion H7. subst.

  assert (p' = p0).
  unfold eval_valexp in H0.
  specialize (roots_maps_get _ _ _ H1). intros.
  unfold heap_get in H0.
  rewrite H10 in H0.
  unfold heap_maps in H14.
  unfold heap_get in H14.
  destruct (heap_get_struct x (heap s2)) eqn:?.
  Focus 2. discriminate.
  crush.
  subst.
  auto.
Qed.

Ltac apply_eval_safety :=
  match goal with
  | [H1 : eval_valexp (roots ?s1) (heap ?s1) ?v = Some (Int ?n),
         H2 : eval_valexp (roots ?s2) (heap ?s2) ?v = Some (Pointer ?p),
              H3 : equiv ?s1 ?s2 |-
     _
    ] =>
    let x := fresh "x" in
    specialize (eval_valexp_safety_int _ _ _ _ H3 H1) as x ;
    rewrite x in H2 ; discriminate
  end.

Ltac splitif :=
  match goal with
  | [ H: context [ if Compare_dec.le_gt_dec ?A ?B then _ else _ ] |- _] =>
    destruct (Compare_dec.le_gt_dec A B)
  | [ |- context [ if Compare_dec.le_gt_dec ?A ?B then _ else _ ] ] =>
    destruct (Compare_dec.le_gt_dec A B)
  end.

Lemma gt_not_in :
  forall h p,
    p > max_heap h ->
    ~ List.In p (fst (List.split h)).
Proof.
  induction h.
  crush.
  intros.
  destruct a.
  destruct (ptr_eq_dec p p0).
  * subst.
    funfold max_heap.
    destruct (Compare_dec.le_gt_dec (max_heap_idx ((p0, l) :: h)%list)) eqn:? ;
      crush ;
      destruct (Compare_dec.le_gt_dec p0 (max_heap_idx h)) eqn:? ;
      crush.
  * funfold max_heap.
    funfold max_heap_idx.
    funfold max_heap_val.
    unfold not. intros.
    specialize (in_split_l_ht h p p0 l ptr_eq_dec).
    intros.
    destructo.
    intuition.
    clear H0 H4 H1.
    specialize (IHh p).
    splitif ; splitif ; splitif ; splitif ; crush.
Qed.

Lemma fresh_ptr_fresh_1 :
  forall s,
    ~ List.In (fresh_ptr s) (fst (List.split (heap s))).
Proof.
  unfold not.
  intros.
  assert ((fresh_ptr s) > max_heap (heap s)).
  unfold fresh_ptr. unfold max_state.
  splitif ; crush.
  eapply gt_not_in ; eauto.
Qed.

Lemma fresh_ptr_fresh_2 :
  forall s,
    heap_get_struct (fresh_ptr s) (heap s) = None.
Proof.
  intros.
  specialize (fresh_ptr_fresh_1 s). intros.
  remember (fresh_ptr s) as p.
  clear Heqp.
  induction (heap s). crush.
  funfold heap_get_struct.
  destruct a.
  destruct (ptr_eq_dec p0 p) eqn:?.
  * subst.
    contradiction H.
    eapply in_split_l_ht ; eauto.
  * assert (~ List.In p (fst (List.split h))).
    -  unfold not.
       intros.
       contradiction H.
       eapply in_split_l_ht ; eauto.
    - intuition.
Qed.

Lemma max_root_max :
  forall v p r,
    p > max_root r ->
    ~List.In (v, S p) r.
Proof.
  induction r. crush.
  funfold max_root.
  destruct a.
  splitif.
  + intuition.
    destruct H0.
    injection H0. intros.
    subst. clear H0.
    crush.
    intuition.
  + unfold not.
    intros.
    destruct H0.
    injection H0.
    crush.
    crush.
Qed.

Lemma fresh_ptr_fresh_3 :
  forall s v p,
    roots_maps (roots s) v p ->
    p <> fresh_ptr s.
Proof.
  unfold not.
  intros.
  subst.
  unfold fresh_ptr in H.
  unfold max_state in H.
  induction (roots s). crush.
  funfold roots_maps.
  destruct a.
  destruct H.
  * crush.
    splitif ; splitif ; splitif ; crush.
  * crush.
    splitif ; splitif ; splitif ; crush ;
      eapply max_root_max ; try apply g0 ; eauto.
Qed.

Lemma fresh_ptr_fresh_4 :
  forall s p k,
    heap_get p k (heap s) = Some (Pointer (fresh_ptr s)) ->
    False.
Proof.
admit.
Admitted.

Lemma fresh_ptr_fresh_5 :
  forall s v,
    roots_maps (roots s) v (fresh_ptr s) ->
    False.
Proof.
Admitted.

Lemma fresh_address_fwd :
  forall address s p p' v,
    addresses (heap s) p address p' ->
    addresses (cons (fresh_ptr s, v) (heap s)) p address p'.
Proof.
Admitted.

Lemma fresh_address_bck :
  forall address s p p' v,
    addresses (cons (fresh_ptr s, v) (heap s)) p address p' ->
    p <> fresh_ptr s ->
    addresses (heap s) p address p'.
Proof.
  induction address ; intros ; inversion H ; clear H ; destructo ; subst.
  * unfold heap_maps_struct in H.
    funfold heap_get_struct.
    edestruct ptr_eq_dec.
    - crush.
    - constructor.
      exists x.
      auto.
  * funfold heap_maps.
    funfold heap_get.
    destruct (heap_get_struct p ((fresh_ptr s, v) :: (heap s))%list) eqn:?.
    Focus 2. discriminate.
    funfold heap_get_struct.
    destruct (ptr_eq_dec (fresh_ptr s) p).
    - crush.
    - specialize (IHaddress s p'0 p' v).
      eapply FollowAddresses.
      + unfold heap_maps.
        unfold heap_get.
        rewrite Heqo.
        apply H5.
      + crush.
        admit.
Admitted.

Lemma fresh_address_contra :
  forall s p address,
    addresses (heap s) p address (fresh_ptr s) ->
    False.
Proof.
  intros.
  specialize (fresh_ptr_fresh_2 s).
  intros.
  dependent induction address generalizing p ;
    inversion H.
  * crush.
  * subst.
    specialize (IHaddress p').
    crush.
Qed.

Lemma option_eval_equiv :
  forall l s1 s2,
    (forall a i,
        eval_valexp (roots s1) (heap s1) a = Some (Int i)
        <->
        eval_valexp (roots s2) (heap s2) a = Some (Int i)) ->
    forall l0 l1,
      option_eval (roots s1) (heap s1) l = Some l0 ->
      option_eval (roots s2) (heap s2) l = Some l1 ->
      struct_equiv l0 l1.
Proof.
  intros until 1.
  induction l.
  crush.
  intros.
  funfold option_eval.

  intuition.
  destruct (eval_valexp (roots s1) (heap s1) a) eqn:? ; try discriminate.
  destruct (eval_valexp (roots s2) (heap s2) a) eqn:? ; try discriminate.
  destruct (option_eval (roots s1) (heap s1) l) eqn:? ; try discriminate.
  destruct (option_eval (roots s2) (heap s2) l) eqn:? ; try discriminate.

  specialize (IHl l2 l3).
  intuition.
  funfold struct_equiv.
  destructo.
  split.
  crush.
  intros.
  destruct n.
  Focus 2. specialize (H3 n i).
  crush.

  clear H3.
  cleanjection.
  specialize (H a i).
  crush.
Qed.


Lemma eval_valexp_equiv :
  forall s1 s2 a i,
    equiv' s1 s2 ->
    eval_valexp (roots s1) (heap s1) a = Some (Int i) ->
    eval_valexp (roots s2) (heap s2) a = Some (Int i).
Proof.
  funfold eval_valexp.
  destruct a. auto.
  intros.
  destruct (roots_get v (roots s1)) eqn:? ; try discriminate.
  specialize (heap_maps_implies_heap_get (heap s1) p n (Int i) H0).
  intros. destructo.
  specialize (H v p TermStr p x).
  assert (roots_maps (roots s1) v p). eapply roots_get_maps ; eauto.
  intuition.

  assert (heap_maps_struct (heap s1) p x).
  funfold heap_maps_struct. auto.

  assert (addresses (heap s1) p TermStr p).
  constructor. eauto.

  intuition.
  destructo.
  specialize (roots_maps_get _ _ _ H4).
  destruct (roots_get v (roots s2)) eqn:?.
  Focus 2. crush.

  intros.
  cleanjection.
  funfold struct_equiv.
  destructo.
  specialize (H9 n i).
  intuition.
  funfold heap_get.
  inversion H6. subst. destructo.
  destruct (heap_get_struct x1 (heap s2)) eqn:? ; crush.
Qed.

Lemma eval_valexp_equiv_bidirectional :
  forall s1 s2,
    equiv' s1 s2 ->
    equiv' s2 s1 ->
    forall a i,
      eval_valexp (roots s1) (heap s1) a = Some (Int i) <->
      eval_valexp (roots s2) (heap s2) a = Some (Int i).
Proof.
  intros.
  split ; eapply eval_valexp_equiv ; eauto.
Qed.

Lemma extract_exists :
  forall {A B: Prop} (H P: Prop),
    H ->
    (exists (a: A) (b: B), P) ->
    exists (a: A) (b: B), H /\ P.
Proof.
  intros.
  destructo.
  repeat eexists ; eauto.
Qed.

Lemma equiv'_class_step_2 :
  forall l s1 s2 l0 l1 v,
    option_eval (roots s1) (heap s1) l = Some l0 ->
    option_eval (roots s2) (heap s2) l = Some l1 ->
    equiv' s1 s2 ->
    equiv' s2 s1 ->
    equiv'
      {|
        roots := roots_set (roots s1) v (fresh_ptr s1);
        heap := ((fresh_ptr s1, l0) :: heap s1)%list;
        output := output s1 |}
      {|
        roots := roots_set (roots s2) v (fresh_ptr s2);
        heap := ((fresh_ptr s2, l1) :: heap s2)%list;
        output := output s2 |}.
Proof.
  intros.
  unfold equiv'.
  crush.
  destruct (var_eq_dec v v0).
  * subst.
    exists (fresh_ptr s2).
    specialize (roots_set_1 _ _ _ _ H3). intros. subst. clear H3.
    inversion H4 ; destructo ; subst ; clear H4.
  - funfold heap_maps_struct.
    rewrite H5 in H3. cleanjection.
    funfold heap_get_struct.
    exists (fresh_ptr s2), l1.
    repeat obv_eq. cleanjection.
    splitto.
    + eapply roots_set_2.
    + constructor.
      exists l1.
      funfold heap_maps_struct.
      funfold heap_get_struct.
      obv_eq.
      reflexivity.
    + reflexivity.
    + eapply option_eval_equiv.
      eapply eval_valexp_equiv_bidirectional.
      apply H1. apply H2.
      eauto. eauto.
  - assert (p' <> fresh_ptr s1).
    + unfold not.
      intros.
      subst.
      clear - H3 H.
      revert H H3.
      generalize l s1 l0 k.
      clear.
      induction l.
      ** intros. funfold option_eval. cleanjection.
         funfold heap_maps. funfold heap_get.
         edestruct heap_get_struct eqn:?.
      -- funfold heap_get_struct.
         obv_eq. crush.
         destruct k ; funfold List.nth_error ; discriminate.
      -- discriminate.
      ** crush.
         destruct k.
      -- clear IHl.
         edestruct eval_valexp eqn:? ;
           try discriminate.
         edestruct option_eval eqn:? ;
           try discriminate.
         cleanjection.
         funfold heap_maps.
         funfold heap_get.
         edestruct heap_get_struct eqn:? ;
           try discriminate.
         funfold heap_get_struct.
         obv_eq. cleanjection.
         unfold List.nth_error in H3.
         cleanjection.
         funfold eval_valexp.
         destruct a.
         discriminate.
         edestruct roots_get ;
           try discriminate.
         eapply fresh_ptr_fresh_4.
         apply Heqo.
      -- edestruct eval_valexp eqn:? ;
           try discriminate.
           edestruct option_eval eqn:? ;
           try discriminate.
         cleanjection.
         specialize (IHl s1 l1 k Heqo0).
         funfold heap_maps.
         funfold heap_get.
         funfold heap_get_struct.
         obv_eq. cleanjection.
         crush.
    + specialize (fresh_address_bck  _ _ _ _ _ H6 H4).
      intros.

      assert (heap_maps_struct (heap s1) p1' struct1).
      funfold heap_maps_struct.
      funfold heap_get_struct.
      edestruct ptr_eq_dec.
      ** cleanjection.
         specialize (fresh_address_contra s1 p' rest).
         intuition.
      ** auto.
      ** dependent induction l ; destruct k.
      -- crush.
         funfold heap_maps.
         funfold heap_get.
         funfold heap_get_struct.
         obv_eq. cleanjection.
         inversion H3.
      -- crush.
         funfold heap_maps.
         funfold heap_get.
         funfold heap_get_struct.
         obv_eq. cleanjection.
         inversion H3.
      -- clear IHl. funfold option_eval.
         funfold heap_maps.
         funfold heap_get.

         destruct (eval_valexp (roots s1) (heap s1) a) eqn:? ;
           destruct (eval_valexp (roots s2) (heap s2) a) eqn:? ;
           destruct (option_eval (roots s1) (heap s1) l) eqn:? ;
           destruct (option_eval (roots s2) (heap s2) l) eqn:? ;
           destruct (heap_get_struct (fresh_ptr s1) ((fresh_ptr s1, l0) :: heap s1)%list) eqn:? ;
           try discriminate.
         funfold heap_get_struct.
         obv_eq. cleanjection.
         unfold List.nth_error in H3.
         cleanjection.
         destruct a. crush.
         funfold eval_valexp.
         destruct (roots_get v (roots s1)) eqn:? ;
           destruct (roots_get v (roots s2)) eqn:? ;
           try discriminate.
         pose proof (H1 v p (FollowStr n rest) p1' struct1).

         assert (roots_maps (roots s1) v p).
         eapply roots_get_maps ; eauto.


         assert (addresses (heap s1) p (FollowStr n rest) p1').
         specialize (fresh_address_bck _ _ _ _ _ H6 H4).
         intros.
         eapply FollowAddresses.
         funfold heap_get.
         destruct (heap_get_struct p (heap s1)) eqn:? ; try discriminate.
         eapply heap_get_implies_heap_maps ; eauto.
         eauto.

         intuition.
         destructo.

         exists x0, x1.
         splitto.
         ++ eapply roots_set_2.
         ++ funfold heap_maps.
            funfold heap_get.
            destruct (heap_get_struct (fresh_ptr s2) ((fresh_ptr s2, v1 :: l3) :: heap s2)%list) eqn:?.
            *** funfold heap_get_struct.
                obv_eq.
                cleanjection.
                unfold List.nth_error.
                destruct (heap_get_struct p0 (heap s2)) eqn:? ;
                  try discriminate.
                specialize (roots_get_maps _ _ _ Heqo4).
                intros.
                specialize (roots_maps_uniq _ _ _ _ H H12).
                intros. subst. clear H12.
                inversion H9. subst.
                funfold heap_maps.
                funfold heap_get.
                rewrite Heqo5 in H16.
                rewrite Heqo0 in H16.
                cleanjection.

                eapply FollowAddresses.
                --- funfold heap_maps. funfold heap_get.
                    funfold heap_get_struct.
                    obv_eq. crush.
                --- eapply fresh_address_fwd. eauto.
            *** funfold heap_get_struct.
                obv_eq.
                discriminate.
         ++ funfold heap_maps_struct.
            funfold heap_get_struct.
            destruct (ptr_eq_dec (fresh_ptr s2) x0).
            Focus 2. auto.
            subst.
            specialize (fresh_ptr_fresh_2 s2).
            intros.
            rewrite H12 in H10.
            discriminate.
         ++ auto.
      -- funfold option_eval.

         destruct (eval_valexp (roots s1) (heap s1) a) eqn:? ;
           destruct (eval_valexp (roots s2) (heap s2) a) eqn:? ;
           destruct (option_eval (roots s1) (heap s1) l) eqn:? ;
           destruct (option_eval (roots s2) (heap s2) l) eqn:? ;
           try discriminate.
         cleanjection.

         funfold heap_maps.
         funfold heap_get.
         funfold heap_maps_struct.
         funfold heap_get_struct.
         obv_eq.

         destruct (ptr_eq_dec (fresh_ptr s1) p1').
         cleanjection.
         specialize (fresh_ptr_fresh_2 s1). intros.
         rewrite H8 in H. discriminate.

         specialize (IHl s1 s2 l2 l3).
         intuition.
         specialize (H0 v0 p1' struct1 k rest).
         destruct (ptr_eq_dec (fresh_ptr s1) p1'). crush.
         intuition.

         specialize (H p').
         obv_eq.
         intuition.

         assert (addresses ((fresh_ptr s1, l2) :: heap s1)%list p' rest p1').
         eapply fresh_address_fwd.
         eapply fresh_address_bck.
         apply H6.
         auto.

         intuition.

         destructo.
         clear H0.

         exists x, x0.
         splitto.
         ++ eapply roots_set_2.
         ++ inversion H9. subst.
            funfold heap_maps.
            funfold heap_get.
            funfold heap_get_struct.
            repeat obv_eq.
            assert (p'0 <> fresh_ptr s2).
            --- unfold not. intros.
                subst.
                funfold heap_maps.
                funfold heap_get.
                funfold heap_get_struct.
                clear - Heqo2 H15.
                revert Heqo2 H15.
                generalize l l3 s2 k.
                clear.
                dependent induction l ; crush.
                destruct k ; funfold List.nth_error ; discriminate.

                edestruct eval_valexp eqn:? ;
                  try discriminate.
                edestruct option_eval eqn:? ;
                  try discriminate.
                cleanjection.
                destruct k.
                +++ crush.
                    funfold eval_valexp.
                    destruct a ;
                      try discriminate.
                    edestruct roots_get eqn:? ;
                      try discriminate.
                    eapply fresh_ptr_fresh_4 ; eauto.
                +++ specialize (IHl l0 s2 k).
                    crush.
            --- unfold List.nth_error.
                eapply FollowAddresses.
                +++ funfold heap_maps.
                    funfold heap_get.
                    funfold heap_get_struct.
                    obv_eq.
                    unfold List.nth_error.
                    apply H15.
                +++ eapply fresh_address_fwd.
                    eapply fresh_address_bck.
                    apply H17.
                    auto.
         ++ destruct (ptr_eq_dec (fresh_ptr s2) x).
            *** inversion H9.
                subst.
                assert (p'0 <> fresh_ptr s2).
            --- unfold not. intros.
                subst.
                funfold heap_maps.
                funfold heap_get.
                destruct (heap_get_struct (fresh_ptr s2) ((fresh_ptr s2, l3) :: heap s2)%list) eqn:? ;
                  try discriminate.
                funfold heap_get_struct.
                obv_eq. cleanjection.
                clear - Heqo2 H15.
                revert Heqo2 H15.
                generalize l x0 k.
                clear.
                dependent induction l ; crush.
                destruct k ; funfold List.nth_error ; discriminate.

                edestruct eval_valexp eqn:? ;
                  edestruct option_eval eqn:? ;
                  try discriminate.
                cleanjection.
                destruct k.
                +++ crush.
                    funfold eval_valexp.
                    destruct a ;
                      try discriminate.
                    edestruct roots_get eqn:? ;
                      try discriminate.
                    eapply fresh_ptr_fresh_4 ; eauto.
                +++ specialize (IHl l0 k).
                    crush.
            --- specialize (fresh_address_bck _ _ _ _ _ H17 H0).
                intros.
                specialize (fresh_address_contra _ _ _ H12).
                crush.
            *** auto.
         ++ auto.

  * assert (roots_maps (roots s1) v0 p1).
    funfold roots_maps. destruct H3.
    cleanjection. crush. crush.

    assert (p1 <> fresh_ptr s1).
    unfold not. intros.
    subst.
    eapply fresh_ptr_fresh_5. eauto.
    clear H3.

    specialize (fresh_address_bck  _ _ _ _ _ H4 H7).
    intros.
    clear H4.

    assert (heap_maps_struct (heap s1) p1' struct1).
    funfold heap_maps_struct. funfold heap_get_struct.
    edestruct ptr_eq_dec. subst.
    specialize (fresh_address_contra _ _ _ H3).
    crush.
    crush.

    clear H5.
    specialize (H1 v0 p1 address p1' struct1).
    intuition.
    destructo.
    exists x, x0, x1.
    splitto.
    - eapply roots_set_4 ; eauto.
    - eapply fresh_address_fwd.
      auto.
    - funfold heap_maps_struct.
      funfold heap_get_struct.
      destruct ptr_eq_dec.
      + subst.
        specialize (fresh_address_contra _ _ _ H5).
        crush.
      + crush.
    - auto.
Qed.

Theorem equiv_class_step_2 :
  forall s1 s2 c s1' s2',
    handle_small_step s1 c = Some s1' ->
    handle_small_step s2 c = Some s2' ->
    equiv s1 s2 ->
    equiv s1' s2'.
Proof.
  intros.
  destruct c ;
    unfold handle_small_step in *.
  * destruct H1. destructo.
    destruct (option_eval (roots s1) (heap s1) l) eqn:?.
    Focus 2. discriminate.
    destruct (option_eval (roots s2) (heap s2) l) eqn:?.
    Focus 2. discriminate.
    cleanjection.
    split. crush. clear H1.
    specialize (eval_valexp_equiv_bidirectional _ _ H2 H3).
    intros.

    split ; eapply equiv'_class_step_2 ; eauto.
  * destruct (eval_valexp (roots s1) (heap s1) v0) eqn:?.
    Focus 2. discriminate.
    destruct (update_heap (roots s1) (heap s1) v n v1) eqn:?.
    Focus 2. discriminate.
    destruct (eval_valexp (roots s2) (heap s2) v0) eqn:?.
    Focus 2. discriminate.
    destruct (update_heap (roots s2) (heap s2) v n v2) eqn:?.
    Focus 2. discriminate.
    crush.
    unfold update_heap in *.

    destruct (roots_get v (roots s1)) eqn:?.
    Focus 2. discriminate.
    destruct (roots_get v (roots s2)) eqn:?.
    Focus 2. discriminate.
    destruct (heap_set_k (heap s1) p n v1) eqn:?.
    Focus 2. discriminate.
    destruct (heap_set_k (heap s2) p0 n v2) eqn:?.
    Focus 2. discriminate.

    crush.

    split. destruct H1. auto.

    assert (equiv s2 s1). eapply equiv_symm ; eauto.

    destruct v0 ; destruct v1 ; destruct v2 ; split ; try apply_eval_safety ;
      crush.
    - unfold equiv'.
      intros.
      crush.
      admit.
    - admit.
    - admit.
    - admit.
    - admit.
    - admit.
  * destruct (eval_valexp (roots s1) (heap s1) v0) eqn:?.
    Focus 2. discriminate.
    destruct v1 eqn:?. discriminate.

    destruct (eval_valexp (roots s2) (heap s2) v0) eqn:?.
    Focus 2. discriminate.
    destruct v2. discriminate.

    crush.
    split. crush. destruct H1. auto.
    destruct H1. destructo.
    split ; unfold equiv' ; intros ; crush ; destruct (var_eq_dec v v1) ; subst.
    - eapply (equiv_single_step _ _ _ _ _ _ _ _ _ _ Heqo) ; eauto.
    - specialize (roots_set_3 _ _ _ _ _ n H2).
      intros.
      specialize (H0 _ _ _ _ _ H5 H3 H4).
      destructo.
      exists x, x0, x1.
      split ; eauto.
      eapply roots_set_4 ; eauto.
    - eapply (equiv_single_step _ _ _ _ _ _ _ _ _ _ Heqo0) ; eauto.
    - specialize (roots_set_3 _ _ _ _ _ n H2).
      intros.
      specialize (H1 _ _ _ _ _ H5 H3 H4).
      destructo.
      exists x, x0, x1.
      split ; eauto.
      eapply roots_set_4 ; eauto.
  * crush.
    split. destruct H1. auto.
    split.
    - unfold equiv'.
      crush.
      destruct (var_eq_dec v v0).
      + subst.
        specialize (roots_unset_1 _ _ _ H).
        intros.
        contradiction H3.
      + specialize (roots_unset_3 _ _ _ _ n H).
        intros.
        destruct H1.
        destructo.
        unfold equiv' in H4.
        specialize (H4 v0 p1 address p1' struct1).
        intuition.
        destructo.
        exists x, x0, x1.
        split.
        eapply roots_unset_2. auto. auto.
        split ; auto.
    - unfold equiv'.
      crush.
      destruct (var_eq_dec v v0).
      + subst.
        specialize (roots_unset_1 _ _ _ H).
        intros.
        contradiction H3.
      + specialize (roots_unset_3 _ _ _ _ n H).
        intros.
        destruct H1.
        destructo.
        unfold equiv' in H5.
        specialize (H5 v0 p1 address p1' struct1).
        intuition.
        destructo.
        exists x, x0, x1.
        split.
        eapply roots_unset_2. auto. auto.
        split ; auto.
  * destruct (eval_valexp (roots s1) (heap s1) v) eqn:?.
    - destruct v0 eqn:?.
      + subst.
        specialize (eval_valexp_safety_int _ _ _ _ H1 Heqo).
        intros.
        rewrite H2 in H0.
        clear H2.
        crush.
        destruct H1.
        crush.
      + discriminate.
    - discriminate.
Admitted.


Inductive execution : state -> list com -> output_t -> Prop :=
| NilExecution : forall state,
    execution state List.nil (output state)
| GcExecution : forall state coms out,
    execution (gc state) coms out ->
    execution state coms out
| ComExecution : forall com coms state state' out,
    handle_small_step state com = Some state' ->
    execution state' coms out ->
    execution state (List.cons com coms) out
.


Theorem execution_output_exists :
  forall coms st st' out,
    execution st coms out ->
    equiv st st' ->
    exists out',
      execution st' coms out'.
Proof.
  intros until 1.
  dependent induction H generalizing st'.
  * intros.
    exists (output st').
    apply NilExecution.
  * intros.
    eapply IHexecution.
    eapply equiv_trans.
    apply equiv_symm.
    apply gc_safety.
    auto.
  * intros.
    specialize (equiv_class_step_1 _ _ _ _ H H1).
    intros.
    destructo.
    specialize (IHexecution x).
    specialize (equiv_class_step_2 _ _ _ _ _ H H2 H1).
    intros.
    intuition.
    destructo.
    exists x0.
    eapply ComExecution.
    apply H2.
    apply H4.
Qed.

Theorem execution_output_equiv :
  forall coms st st' out out',
    execution st coms out ->
    execution st' coms out' ->
    equiv st st' ->
    out = out'
.
Proof.
  intros until 1.
  dependent induction H generalizing st' out'.
  * intros.
    dependent induction H.
    - destruct H0.
      destructo.
      auto.
    - eapply IHexecution.
      reflexivity.
      eapply equiv_trans.
      apply H0.
      eapply gc_safety.
  * intros.
    intuition.
    eapply IHexecution.
    apply H0.
    eapply equiv_trans.
    apply equiv_symm.
    eapply gc_safety.
    apply H1.
  * intros.
    dependent induction H1 ; subst.
    - eapply IHexecution0 ; eauto.
      eapply equiv_trans.
      apply H2.
      eapply gc_safety.
    - eapply IHexecution ; eauto.
      eapply equiv_class_step_2 ; eauto.
Qed.