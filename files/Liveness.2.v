Require Import Gc.Language Gc.Gc Gc.Util.
Require Import List ListSet CpdtTactics Equality Wf Nat Wf_nat.

Lemma subset_property: forall st v p p0 roots,
  (exists address v0 p', roots_maps (roots) v0 p' /\ addresses (heap st) p' address p0) ->
  (exists address v0 p', roots_maps ((v, p) :: roots) v0 p' /\ addresses (heap st) p' address p0)
.
Proof.
  intros.
  destruct H as [a [v0 [p' H]]].
  exists a.
  exists v0.
  exists p'.
  unfold roots_maps.
  crush.
Qed.


Lemma mark_liveness_1 :
  forall r h p vs,
    set_In p (mark r h) ->
    heap_maps_struct h p vs ->
    exists address p' v,
      roots_maps r v p'
      /\
      addresses h p' address p
.
Proof.
  Hint Unfold heap_maps_struct heap_get_struct roots_maps.
  Hint Resolve subset_property.
  Hint Constructors addresses.
  induction r. crush.
  intros.
  specialize (IHr h p vs).

  unfold mark in H ; fold mark in H.
  destruct a.
  destruct (ptr_eq_dec p p0).
  * subst.
    clear IHr.
    exists TermStr.
    exists p0. exists v.
    split. crush.
    eauto.
  * specialize (mark_ptrs_correct _ h p  _ _ H).
    intros.
    intuition.
    destruct H1. destruct H1. destruct H1.
    exists x0. exists x.
    unfold roots_maps.
    specialize (nodup_In_fwd _ _ ptr_eq_dec H1). clear H1. intros.
    specialize (set_inter_elim1 _ _ _ _ H1). clear H1. intros.
    apply in_split_exists_r in H1.
    - destruct H1. exists x1. crush.
    - apply ptr_eq_dec.
Qed.

Lemma mark_sweep_liveness_1 :
  forall st p vs h,
    sweep (heap st) (mark (roots st) (heap st)) = h ->
    heap_maps_struct h p vs ->
    exists address p' v,
      roots_maps (roots st) v p'
      /\
      addresses (heap st) p' address p
.
Proof.
  intros.
  apply (sweep_actually_sweeps (heap st) h (mark (roots st) (heap st)) p vs) in H.
  * destruct H.
    eapply (mark_liveness_1).
    + apply H.
    + apply H1.
  * intuition.
Qed.

Theorem mark_sweep_liveness_2 :
  forall st p vs h,
    (mark_sweep (roots st) (heap st)) = h ->
    heap_maps_struct h p vs ->
    exists address v p',
      roots_maps (roots st) v p'
      /\
      addresses h p' address p
.
Proof.
  intros.
  pose H as temp.
  apply (mark_sweep_liveness_1 st p vs h) in temp.
  * destruct temp as [a [v  [p' [H1 H2]]]].
    eapply pointer_equivalence in H2; eauto.
    exists a, p', v.
    crush.
  * auto.
Qed.


Theorem gc_liveness :
  forall st st' p vs h,
    gc st = st' ->
    (heap st') = h ->
    heap_maps_struct h p vs ->
    exists address v p',
      roots_maps (roots st') v p'
      /\
      addresses h p' address p
.
Proof.
  Hint Unfold gc compact.
  Hint Resolve mark_sweep_liveness_2.
  intros.
  subst.
  unfold gc in *.
  unfold compact in *.
  unfold roots in *.
  unfold heap in *.
  eapply mark_sweep_liveness_2; eauto.
Qed.