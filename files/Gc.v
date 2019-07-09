Require Import Gc.Language Gc.Util.
Require Import List ListSet Equality CpdtTactics.
Require Import Coq.Program.Wf Coq.Logic.ProofIrrelevance FunInd Recdef.
Hint Resolve ptr_eq_dec var_eq_dec.

Inductive addresing_string : Type :=
| TermStr : addresing_string
| FollowStr : nat -> addresing_string -> addresing_string
.

Fixpoint address_length (address: addresing_string) : nat :=
  match address with
  | TermStr => 1
  | FollowStr n rest => S (address_length rest)
  end.

Inductive addresses : heap_t -> ptr -> addresing_string -> ptr -> Prop :=
| TermAddresses : forall h p,
    (exists vs, heap_maps_struct h p vs) ->
    addresses h p TermStr p
| FollowAddresses : forall h p p' p'' k rest,
    heap_maps h p k (Pointer p') ->
    addresses h p' rest p'' ->
    addresses h p (FollowStr k rest) p''
.

Lemma address_maps_to_value :
  forall h p p' address,
  addresses h p address p' ->
  exists vs, heap_maps_struct h p' vs
.
Proof.
  intros.
  dependent induction address generalizing p; inversion H; eauto.
Qed.

Fixpoint union_pointers (l : list (set ptr)) : set ptr :=
  match l with
  | nil => (empty_set ptr)
  | h::t => (set_union ptr_eq_dec h  (union_pointers t))
  end.

Theorem union_pointers_nodup :
  forall l,
    Forall (fun a => NoDup a) l ->
    NoDup (union_pointers l).
Proof.
  intros.
  induction l.
  constructor.
  eapply set_union_nodup ;
    inversion H ;
    eauto.
Qed.

Theorem nth_union_pointers:
  forall l n p,
    set_In p (nth n l (@nil ptr)) ->
    set_In p (union_pointers l).
Proof.
  induction l ; induction n ; intros.
  * inversion H.
  * crush.
  * crush.
    eapply set_union_intro1. auto.
  * crush.
    specialize (IHl n p). intuition.
    eapply set_union_intro2. auto.
Qed.

Theorem nth_union_pointers_inv:
  forall l p,
    set_In p (union_pointers l) ->
    exists n, set_In p (nth n l (@nil nat)).
Proof.
  induction l. crush.
  intros.
  unfold union_pointers in H.
  fold union_pointers in H.
  specialize (set_union_elim ptr_eq_dec p a (union_pointers l) H).
  intros.
  destruct H0.
  * exists 0.
    crush.
  * specialize (IHl p H0).
    destruct IHl.
    exists (S x).
    crush.
Qed.


Definition add_vals (h: heap_t) (p: ptr) : set ptr :=
  nodup
    ptr_eq_dec
    match heap_get_struct p h with
    | Some vs =>
      (List.flat_map
         (fun v =>
            match v with
            | Int _ => nil
            | Pointer p' =>
              match heap_get_struct p' h with
              | Some _ => p'::nil
              | None => nil
              end
            end
         ) vs)
    | None => nil
    end.

Theorem add_vals_subset :
  forall h p p',
    set_In p' (add_vals h p) ->
    In p' (fst (split h)).
Proof.
  intros.
  unfold add_vals in H.
  destruct (heap_get_struct p h) eqn:?. Focus 2. crush.
  clear Heqo.
  induction l. crush.
  unfold flat_map in H ; fold flat_map in H.
  destruct a.
  repeat match goal with
  | [ H: context [nil ++ ?l] |- _ ] =>
    rewrite (app_nil_l) in H
  end.
  intuition.
  destruct (heap_get_struct p0 h) eqn:?.
  * unfold app in H.
    unfold nodup in H.
    destruct (in_dec ptr_eq_dec p0).
    - intuition.
    - crush.
      eapply heap_get_in. apply Heqo.
  * crush.
Qed.

Definition mark_ptr_single (h: heap_t) (ps: set ptr) : set ptr :=
  nodup
    ptr_eq_dec
    (
      List.flat_map (
          fun p =>
            set_add
              ptr_eq_dec
              p
              (add_vals h p)
        ) ps
    ).

Theorem mark_ptr_single_nodup :
  forall h ps,
    NoDup ps ->
    NoDup (mark_ptr_single h ps).
Proof.
  intros.
  eapply NoDup_nodup.
Qed.

Theorem mark_ptr_single_monotonic_1 :
  forall h p ps,
    NoDup ps ->
    In p ps ->
    In p (mark_ptr_single h ps).
Proof.
  intros until ps. revert h p.
  induction ps. crush.
  intros.
  inversion H. clear H. subst.
  specialize (IHps h p H4).
  destruct H0. subst.
  * unfold mark_ptr_single. fold mark_ptr_single.
    eapply nodup_In.
    unfold flat_map ; fold flat_map.
    eapply in_or_app.
    left.
    eapply set_add_intro2. reflexivity.
  * intuition.
    unfold mark_ptr_single ; fold mark_ptr_single.
    eapply nodup_In.
    unfold flat_map ; fold flat_map.
    eapply in_or_app.
    right.
    unfold mark_ptr_single in H0.
    specialize (nodup_In_fwd _ _ ptr_eq_dec H0).
    intros.
    intuition.
Qed.

Theorem mark_ptr_single_monotonic_2 :
  forall h ps,
    NoDup ps ->
    incl ps (mark_ptr_single h ps).
Proof.
  unfold incl.
  intros.
  eapply mark_ptr_single_monotonic_1 ; auto.
Qed.

Lemma mark_ptr_single_subset_1 :
  forall h ps p,
    NoDup ps ->
    incl ps (fst (split h)) ->
    set_In p (mark_ptr_single h ps) ->
    set_In p (fst (split h)).
Proof.
  induction ps. crush.
  intros. inversion H. subst. clear H.
  assert (incl ps (fst (split h))). eapply incl_cons_inv. apply H0.
  specialize (IHps p H5 H).
  specialize (nodup_In_fwd _ _ ptr_eq_dec H1).
  intros.
  unfold flat_map in * ; fold flat_map in *.
  destruct (in_app_or _ _ _ H2) ; clear H2.
  * destruct (set_add_elim _ _ _ _ H3) ; clear H3.
    - unfold incl in H0.
      specialize H0 with a.
      assert (In a (a :: ps)) ; crush.
    - eapply add_vals_subset.
      apply H2.
  * unfold mark_ptr_single in IHps.
    unfold flat_map in IHps.
    unfold set_In in *.
    specialize (nodup_In_inv _ _ ptr_eq_dec H3).
    intros.
    clear H3.
    intuition.
Qed.

Lemma mark_ptr_single_subset_2 :
  forall h ps,
    NoDup ps ->
    incl ps (fst (split h)) ->
    incl (mark_ptr_single h ps) (fst (split h)).
Proof.
  unfold incl.
  intros.
  eapply mark_ptr_single_subset_1. apply H. auto. auto.
Qed.

Lemma mark_ptr_single_subset_3 :
  forall h ps,
    NoDup ps ->
    incl ps (fst (split h)) ->
    length (mark_ptr_single h ps) <= length (fst (split h)).
Proof.
  intros.
  eapply NoDup_incl_length.
  eapply mark_ptr_single_nodup. auto.
  eapply mark_ptr_single_subset_2. auto. auto.
Qed.

Lemma mark_ptr_single_saturates_inv :
  forall h ps,
    NoDup ps ->
    incl ps (fst (split h)) ->
    length ps = length (mark_ptr_single h ps) ->
    incl (mark_ptr_single h ps) ps.
Proof.
  intros.
  eapply NoDup_length_incl.
  auto.
  crush.
  eapply mark_ptr_single_monotonic_2.
  auto.
Qed.

Lemma mark_ptr_single_equiv :
  forall h ps ps',
    NoDup ps ->
    incl ps (fst (split h)) ->
    NoDup ps' ->
    incl ps' (fst (split h)) ->
    incl ps ps' ->
    incl ps' ps ->
    incl (mark_ptr_single h ps) (mark_ptr_single h ps').
Proof.
  unfold incl.
  intros.
  unfold mark_ptr_single in *.
  specialize (nodup_In_fwd _ _ ptr_eq_dec H5) ; clear H5 ; intros.
  eapply nodup_In_inv.
  specialize (in_flat_map_fwd _ _ _ H5) ; clear H5 ; intros.
  destruct H5. destruct H5.
  eapply in_flat_map_inv. exists x. crush.
Qed.

Lemma mark_ptr_single_saturates :
  forall h ps,
    NoDup ps ->
    incl ps (fst (split h)) ->
    incl (mark_ptr_single h ps) ps ->
    incl (mark_ptr_single h (mark_ptr_single h ps)) (mark_ptr_single h ps).
Proof.
  intros.
  eapply mark_ptr_single_equiv ; auto.
  * eapply mark_ptr_single_nodup. auto.
  * eapply mark_ptr_single_subset_2. auto. auto.
  * eapply mark_ptr_single_monotonic_2. auto.
Qed.

Function mark_ptrs (h: heap_t) (ps: set ptr) (H: NoDup ps) (H': incl ps (fst (split h))) {measure (fun z => (length h - length z)) ps} : set ptr :=
  let new := mark_ptr_single h ps in
  if PeanoNat.Nat.eq_dec (length ps) (length new)
  then
    new
  else
    mark_ptrs h new (mark_ptr_single_nodup h ps H) (mark_ptr_single_subset_2 h ps H H')
.
Proof.
  intros.
  assert (length ps > 0).
  destruct ps ; crush.

  assert (length (mark_ptr_single h ps) >= length ps).
  assert (incl ps (mark_ptr_single h ps)).
  eapply mark_ptr_single_monotonic_2 ; auto.
  eapply NoDup_incl_length ; auto.

  assert (length (mark_ptr_single h ps) > length ps).
  crush.

  assert (length (mark_ptr_single h ps) <= length h).
  specialize (mark_ptr_single_subset_3 _ _ H H').
  intros.
  specialize (split_length_l h). intros. crush.

  assert (length ps < length h) ; crush.
Defined.

Lemma mark_ptr_single_saturates_2 :
  forall h ps ND IL,
    length (mark_ptrs h ps ND IL) = length (mark_ptr_single h (mark_ptrs h ps ND IL)).
Proof.
  intros.
  functional induction (mark_ptrs h ps ND IL).
  * assert (incl (mark_ptr_single h ps) ps).
    eapply mark_ptr_single_saturates_inv ; eauto.

    specialize (mark_ptr_single_saturates h ps H H' H0).
    intros.


    specialize (mark_ptr_single_saturates h ps H).
    assert (incl (mark_ptr_single h ps) ps).
    eapply NoDup_length_incl.
    auto. crush. eapply mark_ptr_single_monotonic_2. auto.
    intros.
    intuition.

    assert (length (mark_ptr_single h ps) <= length (mark_ptr_single h (mark_ptr_single h ps))).
    eapply NoDup_incl_length ; eauto. eapply mark_ptr_single_nodup. auto.
    eapply mark_ptr_single_monotonic_2. eapply mark_ptr_single_nodup. auto.

    assert (length (mark_ptr_single h (mark_ptr_single h ps)) <= length (mark_ptr_single h ps)).
    eapply NoDup_incl_length ; eauto. eapply mark_ptr_single_nodup ; eauto.
    eapply mark_ptr_single_nodup. auto.
    crush.
  * crush.
Qed.

Program Definition mark (r: roots_t) (h: heap_t) : set ptr :=
  let root_ptrs := (snd (split r)) in
  let present_root_ptrs := set_inter ptr_eq_dec root_ptrs (fst (split h)) in
  mark_ptrs h (nodup ptr_eq_dec present_root_ptrs) _ _
.
Next Obligation.
  eapply NoDup_nodup.
Defined.
Next Obligation.
  unfold incl. intros.
  specialize (nodup_In ptr_eq_dec (set_inter ptr_eq_dec (snd (split r)) (fst (split h))) a). intros. destruct H0.
  intuition. clear - H2.
  destruct (set_inter_elim _ _ _ _ H2) ; auto.
Defined.

Theorem mark_ptrs_fixy :
  forall h ps p H1 H2 H3 H4,
    NoDup ps ->
    set_In p (mark_ptrs h (mark_ptr_single h ps) H1 H2) ->
    set_In p (mark_ptrs h ps H3 H4).
Proof.
  intros until 2.
  functional induction (mark_ptrs h ps H3 H4); intros ; clear e.
  * rewrite mark_ptrs_equation in H0.
    edestruct PeanoNat.Nat.eq_dec.
    - assert (incl (mark_ptr_single h (mark_ptr_single h ps)) (mark_ptr_single h ps)).
      eapply mark_ptr_single_saturates_inv ; auto.

      unfold incl in H4.
      specialize H4 with p.
      intuition.
    - contradict n.
      specialize (mark_ptr_single_saturates h ps H).
      assert (incl (mark_ptr_single h ps) ps).
      eapply NoDup_length_incl.
      auto. crush. eapply mark_ptr_single_monotonic_2. auto.
      intros.
      intuition.

      assert (length (mark_ptr_single h ps) <= length (mark_ptr_single h (mark_ptr_single h ps))).
      eapply NoDup_incl_length ; eauto. eapply mark_ptr_single_monotonic_2. auto.

      assert (length (mark_ptr_single h (mark_ptr_single h ps)) <= length (mark_ptr_single h ps)).
      eapply NoDup_incl_length ; eauto. eapply mark_ptr_single_nodup ; eauto.
      crush.
  * assert (H1 = (mark_ptr_single_nodup h ps H3)).
    eapply proof_irrelevance. rewrite <- H4. clear H4.
    assert (H2 = (mark_ptr_single_subset_2 h ps H3 H')).
    eapply proof_irrelevance. rewrite <- H4. clear H4.
    auto.
Qed.

Theorem mark_ptrs_nodup:
  forall h ps H H',
    NoDup ps ->
    NoDup (mark_ptrs h ps H H').
Proof.
  intros.
  functional induction (mark_ptrs h ps H H'); intros ; clear e.
  * eapply mark_ptr_single_nodup. auto.
  * assert (NoDup (mark_ptr_single h ps)). eapply mark_ptr_single_nodup.
    auto.
    intuition.
Qed.

Theorem mark_ptrs_subset :
  forall h ps H H',
    incl (mark_ptrs h ps H H') (fst (split h)).
Proof.
  intros.
  functional induction (mark_ptrs h ps H H'); intros ; clear e.
  * eapply mark_ptr_single_subset_2. auto. auto.
  * auto.
Qed.

Theorem mark_ptrs_monotonic :
  forall h p ps H H',
    set_In p ps ->
    set_In p (mark_ptrs h ps H H').
Proof.
  intros.
  functional induction (mark_ptrs h ps H H'); intros ; clear e.
  * assert (incl ps (mark_ptr_single h ps)).
    eapply mark_ptr_single_monotonic_2. auto.
    unfold incl in H1.
    specialize (H1 p).
    intros.
    intuition.
  * assert (set_In p (mark_ptr_single h ps)).
    eapply mark_ptr_single_monotonic_2 ; auto.
    intuition.
Qed.

Lemma mark_ptr_single_marks_address :
  forall h ps address n p p' p'',
    heap_maps h p n (Pointer p') ->
    addresses h p' address p'' ->
    set_In p ps ->
    set_In p' (mark_ptr_single h ps).
Proof.
  induction ps. crush.
  intros.
  unfold set_In in *.
  destruct H1.
  * subst.
    clear IHps.
    unfold mark_ptr_single ; fold mark_ptr_single.
    eapply nodup_In_inv.
    eapply in_flat_map_inv.
    exists p. crush.
    eapply set_add_intro1.
    unfold add_vals.
    eapply nodup_In.
    unfold heap_maps in H. unfold heap_get in H.
    edestruct heap_get_struct eqn:?. Focus 2. discriminate.
    assert (exists v, heap_get_struct p' h = Some v).
    - inversion H0. auto.
      unfold heap_maps in H1. unfold heap_get in H1.
      destruct (heap_get_struct p' h) eqn:?. eexists. eauto. discriminate.
    - clear H0.
      destruct H1.
      clear Heqo.
      specialize (nth_error_In _ _ H).
      intros.
      clear H.
      induction l. crush.
      destruct H1.
      + subst. clear IHl.
        unfold flat_map ; fold flat_map.
        rewrite H0.
        eapply in_app_iff. left. crush.
      + crush.
  * unfold mark_ptr_single ; fold mark_ptr_single.
    specialize (IHps address n p p' p'' H H0 H1).
    crush.
    eapply nodup_In_inv.
    unfold mark_ptr_single in IHps.
    specialize (nodup_In_fwd _ _ ptr_eq_dec IHps); clear IHps ; intros.
    eapply in_or_app.
    right.
    auto.
Qed.

Theorem mark_ptrs_marks :
  forall address ps h p p' ND IL,
    addresses h p address p' ->
    set_In p ps ->
    set_In p' (mark_ptrs h ps ND IL)
.
Proof.
  induction address.
  * intros.
    inversion H ; subst ; clear H.
    destruct H1.
    assert (set_In p' (mark_ptr_single h ps)).
    - specialize (mark_ptr_single_monotonic_2 h ps ND).
      unfold incl.
      intros.
      specialize (H1 p' H0).
      auto.
    - eapply mark_ptrs_monotonic.
      auto.
  * intros.
    inversion H ; subst ; clear H.
    assert (set_In p'0 (mark_ptr_single h ps)).
    - clear IHaddress.
      eapply mark_ptr_single_marks_address. apply H5. apply H7. auto.
    - specialize (IHaddress (mark_ptr_single h ps) h p'0 p').

      assert (NoDup (mark_ptr_single h ps)).
      eapply mark_ptr_single_nodup. auto.

      assert (incl (mark_ptr_single h ps) (fst (split h))).
      eapply mark_ptr_single_subset_2 ; auto.

      specialize (IHaddress H1 H2 H7 H).
      eapply mark_ptrs_fixy.
      auto.
      apply IHaddress.
Qed.

Theorem mark_ptr_single_correct :
  forall ps h p',
    set_In p' (mark_ptr_single h ps) ->
    ~set_In p' ps ->
    exists p k,
      set_In p ps
      /\
      heap_maps h p k (Pointer p').
Proof.
  unfold mark_ptr_single. intros.
  specialize (nodup_In_fwd _ _ ptr_eq_dec H). clear H. intros.
  specialize (in_flat_map_fwd _ _ _ H). clear H. intros.
  destruct H. destruct H.
  exists x.
  unfold add_vals in H1.
  destruct (set_add_elim _ _ _ _ H1). subst. intuition.
  clear H1.
  specialize (nodup_In_fwd _ _ ptr_eq_dec H2). clear H2. intros.
  destruct (heap_get_struct x h) eqn:?. Focus 2. inversion H1.
  specialize (in_flat_map_fwd _ _ _ H1). clear H1. intros.
  destruct H1. destruct H1.
  destruct x0. crush.
  destruct (heap_get_struct p h). crush.
  * specialize (In_nth _ _ (Int 0) H1).
    intros.
    destruct H2. destruct H2.
    exists x0.
    split. auto.
    unfold heap_maps.
    clear - H3 Heqo.
    induction h. crush.
    destruct a.
    destruct (ptr_eq_dec x p). crush.
    destruct (ptr_eq_dec p p).
    - injection Heqo. clear Heqo. intros. subst.
      unfold heap_get ; fold heap_get.
      unfold heap_get_struct ; fold heap_get_struct.
      edestruct ptr_eq_dec.
      + specialize (nth_default_eq x0 l (Int 0)).
        intros.
        unfold nth_default in H.
        destruct (nth_error l x0). crush. crush.
      + crush.
    - crush.
    - unfold heap_get_struct in Heqo ; fold heap_get_struct in Heqo.
      edestruct ptr_eq_dec. crush.
      crush.
      unfold heap_get.
      unfold heap_get_struct. fold heap_get_struct.
      edestruct ptr_eq_dec ; crush.
  * crush.
Qed.

Theorem mark_ptrs_correct :
  forall ps h p' ND IL,
    set_In p' (mark_ptrs h ps ND IL) ->
    exists p address,
      set_In p ps
      /\
      addresses h p address p'.
Proof.
  intros.
  functional induction (mark_ptrs h ps ND IL); intros ; clear e.
  * exists p'. exists TermStr.
    split.
    - eapply mark_ptr_single_saturates_inv ; eauto.
    - constructor.
      specialize (mark_ptr_single_subset_2 _ _ H0 H').
      intros.
      unfold incl in H1.
      specialize (H1 p' H).
      clear - H1.
      specialize (in_split_exists_l _ _ ptr_eq_dec H1).
      intros.
      destruct H.
      clear - H.
      induction h. crush.
      unfold heap_maps_struct in *.
      unfold heap_get_struct ; fold heap_get_struct.
      destruct a.
      destruct H.
      + injection H. clear H. intros. subst.
        edestruct ptr_eq_dec ; crush.
        exists x. auto.
      + edestruct ptr_eq_dec ; crush.
        exists l. auto.
  * intuition.
    destruct H1 ; destruct H1 ; destruct H1.
    destruct (In_dec ptr_eq_dec x ps). exists x. exists x0. crush.
    specialize (mark_ptr_single_correct ps h x H1 n).
    intros.
    destruct H3. destruct H3. destruct H3.
    exists x1.
    exists (FollowStr x2 x0).
    split. auto.
    eapply FollowAddresses ; eauto.
Qed.

Theorem heap_marks :
  forall address r h v p p',
    roots_maps r v p ->
    addresses h p address p' ->
    set_In p' (mark r h)
.
Proof.
  intros.
  unfold roots_maps in *.
  unfold mark.
  eapply mark_ptrs_marks. apply H0.
  eapply nodup_In_inv.
  eapply set_inter_iff.
  split.
  * specialize (in_split_r _ _ H).
    intros.
    crush.
  * inversion H0 ; subst.
    - destruct H1.
      eapply heap_get_in.
      apply H1.
    - unfold heap_maps in *.
      unfold heap_get in *.
      destruct (heap_get_struct p h) eqn:?. Focus 2. discriminate.
      eapply heap_get_in.
      apply Heqo.
Qed.

Lemma mark_extend :
  forall r h n p p' address p'',
    heap_maps h p n (Pointer p') ->
    set_In p (mark r h) ->
    addresses h p' address p'' ->
    set_In p' (mark r h).
Proof.
  intros.
  assert (length (mark r h) = length (mark_ptr_single h (mark r h))).
  * clear.
    unfold mark.
    eapply mark_ptr_single_saturates_2.
  * unfold mark.
    eapply mark_ptr_single_saturates_inv.
    - eapply mark_ptrs_nodup. eapply NoDup_nodup.
    - eapply mark_ptrs_subset.
    - crush.
    - eapply mark_ptr_single_marks_address ; eauto.
Qed.

Fixpoint sweep (h: heap_t) (ptrs: set ptr) : heap_t :=
  match h with
  | List.nil => List.nil
  | List.cons (ptr, val) tail =>
    if set_mem ptr_eq_dec ptr ptrs then
      (ptr,val) :: (sweep tail ptrs)
    else
      sweep tail ptrs
  end
.

Definition mark_sweep (r: roots_t) (h: heap_t) : heap_t :=
  sweep h (mark r h)
.

(* NOP compact for now *)
Definition compact (r: roots_t) (h: heap_t) : (roots_t * heap_t) :=
  (r, h)
.

Definition gc (s : state) : state :=
  let roots := (roots s) in
  let heap := (heap s) in
  let output := (output s) in
  let (roots', heap') := compact roots (mark_sweep roots heap) in
  mkState
    roots'
    heap'
    output
  .

Lemma sweep_safe :
  forall h p v ps,
    In p ps ->
    heap_get_struct p h = Some v ->
    heap_get_struct p (sweep h ps) = Some v.
Proof.
  induction h. crush.
  intros.
  specialize (IHh p v ps H).
  destruct a.
  unfold heap_get_struct in * ; fold heap_get_struct in *.
  edestruct ptr_eq_dec.
  * injection H0 ; clear H0 ; intros ; subst.
    unfold sweep in * ; fold sweep in *.
    specialize (set_mem_correct2 ptr_eq_dec _ _ H).
    intros. rewrite H0.
    unfold heap_get_struct ; fold heap_get_struct.
    edestruct ptr_eq_dec ; crush.
  * intuition.
    destruct (ptr_eq_dec p0 p) eqn:?. crush.
    unfold sweep ; fold sweep.
    edestruct set_mem eqn:?.
    - unfold heap_get_struct ; fold heap_get_struct.
      rewrite Heqs. auto.
    - auto.
Qed.

Lemma sweep_actually_sweeps :
  forall h h' ptrs p vs,
    sweep h ptrs = h' ->
    heap_maps_struct h' p vs ->
    set_In p ptrs /\ heap_maps_struct h p vs
.
Proof.
  Hint Unfold heap_maps_struct heap_get_struct sweep.
  induction h; intros.
  * simpl in *.
    repeat autounfold in *.
    crush.
  * simpl in *.
    destruct a.
    destruct (set_mem ptr_eq_dec p0 ptrs) eqn:?.
    + intuition.
      - eapply set_mem_correct1 in Heqb.
        remember (ptr_eq_dec p p0).
        inversion s; subst; auto.
        unfold heap_maps_struct in H0.
        unfold heap_get_struct in H0.
        fold heap_get_struct in H0.
        edestruct ptr_eq_dec; intuition.
        eapply IHh; intuition.
        apply H0.
      - unfold heap_maps_struct.
        unfold heap_get_struct.
        fold heap_get_struct.
        edestruct ptr_eq_dec.
        ** subst.
           unfold heap_maps_struct in H0.
           unfold heap_get_struct in H0.
           fold heap_get_struct in H0.
           edestruct ptr_eq_dec in H0; intuition.
        ** subst.
           unfold heap_maps_struct in H0.
           unfold heap_get_struct in H0.
           fold heap_get_struct in H0.
           edestruct ptr_eq_dec; intuition.
           eapply (IHh (sweep h ptrs) ptrs p vs); intuition.
    + intuition.
      - apply (IHh h' ptrs p vs); intuition.
      - eapply set_mem_complete1 in Heqb.
        eapply (not_in_set_neq p p0 ptrs) in Heqb.
        ** unfold heap_maps_struct.
           unfold heap_get_struct.
           fold heap_get_struct.
           edestruct ptr_eq_dec; intuition.
           apply (IHh h' ptrs p vs); intuition.
        ** apply (IHh h' ptrs p vs); intuition.
Qed.

Lemma pointer_equivalence' :
  forall address r h p p',
    addresses h p address p' ->
    set_In p (mark r h) ->
    addresses (sweep h (mark r h)) p address p'.
Proof.
  induction address ; intros ; inversion H ; clear H ; subst.
  * destruct H1.
    constructor.
    unfold heap_maps_struct in *.
    specialize (sweep_safe h p' x (mark r h) H0 H).
    intros.
    exists x.
    auto.
  * specialize (IHaddress r h p'0 p' H7).
    assert (set_In p'0 (mark r h)).
    - eapply mark_extend ; eauto.
    - eapply FollowAddresses.
      + unfold heap_maps in *. unfold heap_get in *.
        destruct (heap_get_struct p h) eqn:?. Focus 2. discriminate.
        specialize (sweep_safe h p l (mark r h) H0 Heqo).
        intros.
        rewrite H1.
        apply H5.
      + eapply IHaddress.
        apply H.
Qed.

Lemma pointer_equivalence :
  forall address r h v p p',
    roots_maps r v p ->
    addresses h p address p' ->
    addresses (mark_sweep r h) p address p'.
Proof.
  intros.
  eapply pointer_equivalence'.
  apply H0.
  eapply heap_marks.
  apply H.
  eapply TermAddresses.
  inversion H0.
  * apply H1.
  * unfold heap_maps in H1. unfold heap_get in H1.
    destruct (heap_get_struct p h) eqn:?.
  - exists l. crush.
  - crush.
Qed.

Lemma value_equivalence :
  forall r h h' p vs vs',
    (mark_sweep r h) = h' ->
    heap_maps_struct h p vs ->
    heap_maps_struct h' p vs' ->
    vs = vs'
.
Proof.
  Hint Resolve heap_maps_struct_cons.
  intros.
  unfold mark_sweep in H.
  destruct (mark r h).
  * assert (h' = nil).
    clear H0.
    - induction h.
      + crush.
      + unfold sweep in H.
        fold sweep in H.
        destruct a.
        destruct (set_mem ptr_eq_dec p0 nil) eqn:?; crush.
    - destruct (sweep h nil).
      + subst.
        inversion H1.
      + crush.
  * dependent induction h.
    - inversion H0.
    - unfold sweep in H.
      fold sweep in H.
      destruct a eqn:?.
      specialize (ptr_eq_dec p1 p); intros.
      destruct H2; destruct (set_mem ptr_eq_dec p1 (p0 :: s)) eqn:?.
      + subst.
        unfold heap_maps_struct in *.
        unfold heap_get_struct in *.
        destruct (ptr_eq_dec p p); crush.
      + apply set_mem_complete1 in Heqb.
        apply (sweep_actually_sweeps h h' (p0 :: s) p vs') in H; crush.
      + eapply IHh; eauto.
        eapply (heap_maps_struct_cons (sweep h (p0 :: s)) p p1 l vs'); auto; subst; apply H1; auto.
      + eapply IHh; eauto.
Qed.
