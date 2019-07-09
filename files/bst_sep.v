Require Import VST.floyd.proofauto.
Require Import VerifyBST.prog.BST.
Require Import VerifyBST.bst_model.

Instance CompSpecs : compspecs. make_compspecs prog. Defined.
Definition Vprog : varspecs. mk_varspecs prog. Defined.

Definition t_struct_tree := Tstruct __node noattr.

Definition nonex : Z := -1.
Definition nullkey : Z := Int.min_signed.

Fixpoint tree_rep' (t: tree Z) (p: val) (parent: val) : mpred :=
 match t with
 | E => !!(p=nullval) && emp
 | T a x v b => !! (Int.min_signed <= x <= Int.max_signed) &&
    EX pa:val, EX pb:val,
    data_at Tsh t_struct_tree (Vint (Int.repr x),(Vint (Int.repr v),(pa,(pb,parent)))) p *
    tree_rep' a pa p * tree_rep' b pb p
 end.

Definition tree_rep (t: tree Z) (p: val) : mpred := tree_rep' t p nullval.

(* should assume k is in t *)
(* XXX : maybe  (lookup nonex k t <> nonex ) in some preconditions should be moved here *)
Fixpoint node_in_tree_rep' (t: tree Z) (root: val) (parent: val) (k: Z)(v: Z)(key: val) : mpred :=
 match t with
 | E => !!(root=nullval) && emp
 | T a x y b => 
    if k=?x then 
      !! (Int.min_signed <= x <= Int.max_signed) && !! (y = v) && !! (key = root) &&
      EX pa:val, EX pb:val,
      data_at Tsh t_struct_tree (Vint (Int.repr x),(Vint (Int.repr y),(pa,(pb,parent)))) root *
      tree_rep' a pa root * 
      tree_rep' b pb root
    else 
      !! (Int.min_signed <= x <= Int.max_signed) &&
      EX pa:val, EX pb:val,
      data_at Tsh t_struct_tree (Vint (Int.repr x),(Vint (Int.repr y),(pa,(pb,parent)))) root *
      (* only one of these two will meet k=x *)
      node_in_tree_rep' a pa root k v key * 
      node_in_tree_rep' b pb root k v key
 end.


Lemma node_in_tree_rep'_implies_tree_rep':
  forall t r k v ret parent,
  (node_in_tree_rep' t r parent k v ret)
  |--
  tree_rep' t r parent.
Proof.
  intros.
  revert r parent.
  induction t; intros; unfold node_in_tree_rep', tree_rep, tree_rep'.
  + entailer!.
  + fold tree_rep'.
    destruct (k =? k0); Intros pa pb; simpl; Exists pa pb.
    - entailer!.
    - fold node_in_tree_rep'.
      entailer!.
Qed.


Lemma node_in_tree_nonex(t: tree Z)(BST: is_bst t) (root: val) (parent: val) (k: Z)(v: Z)(key: val) :
  tree_rep' t root parent |--
  node_in_tree_rep' t root parent k v key.
Proof.
  intros. revert root parent.
  induction t; intros.
  - simpl. entailer!.
  - simpl.
    assert(k=k0\/k<>k0) by omega.
    destruct H.
    + subst. rewrite Z.eqb_refl.
      Intros pa pb.
      Exists pa pb.
      entailer!.
      (* FIXME: this means stricter constraint is needed. *)
      admit.
    + assert(k=?k0=false). { apply Z.eqb_neq. omega. }
      rewrite H0.
      Intros pa pb.
      Exists pa pb.
      sep_apply IHt1. 
      { apply is_bst_left in BST; auto. }
      sep_apply IHt2. 
      { apply is_bst_right in BST; auto. }
      entailer!.
Admitted.

(* Aborted trial *)
(*
Fixpoint node_in_tree_rep'_2 (t: tree Z) (root: val) (parent: val) (k: Z)(v: Z)(key: val) : mpred :=
 match t with
 | E => !!(root=nullval) && emp
 | T a x y b => 
    if k=?x then 
      !! (Int.min_signed <= x <= Int.max_signed) && !! (y = v) && !! (key = root) &&
      EX pa:val, EX pb:val,
      data_at Tsh t_struct_tree (Vint (Int.repr x),(Vint (Int.repr y),(pa,(pb,parent)))) root *
      tree_rep' a pa root * 
      tree_rep' b pb root
    else if k<?x then
      !! (Int.min_signed <= x <= Int.max_signed) &&
      EX pa:val, EX pb:val,
      data_at Tsh t_struct_tree (Vint (Int.repr x),(Vint (Int.repr y),(pa,(pb,parent)))) root *
      node_in_tree_rep'_2 a pa root k v key * 
      tree_rep' b pb root
    else 
      !! (Int.min_signed <= x <= Int.max_signed) &&
      EX pa:val, EX pb:val,
      data_at Tsh t_struct_tree (Vint (Int.repr x),(Vint (Int.repr y),(pa,(pb,parent)))) root *
      tree_rep' a pa root *
      node_in_tree_rep'_2 b pb root k v key 
 end.

Lemma node_in_tree_rep_equiv (t: tree Z) (root: val) (parent: val) (k: Z)(v: Z)(key: val) :
  node_in_tree_rep' t root parent k v key = 
  node_in_tree_rep'_2 t root parent k v key.
Proof.
  revert root parent k v key. induction t; intros.
  - auto.
  - simpl. destruct (k0=?k) eqn:eq.
    + auto.
    + destruct (k0<?k) eqn:eq1.
      * autorewrite with norm. hint.
        rewrite IHt1.
*)




(* XXX: perhaps need more consideration about NULL*)
(* maybe there will be unnecessary conditions in some specs *)
Definition node_in_tree_rep (t: tree Z) (root: val)(k: Z)(v: Z)(key: val) : mpred :=
  !!(lookup nonex k t <> nonex ) (* This implies t is nonempty *)
  && node_in_tree_rep' t root nullval k v key.



Fixpoint partial_tree_rep' (pt: partial_tree Z) (p: val) (parent: val) : mpred :=
 match pt with
 | Hole => emp
 | HL a x v b => !! (Int.min_signed <= x <= Int.max_signed) &&
    EX pa:val, EX pb:val,
    data_at Tsh t_struct_tree (Vint (Int.repr x),(Vint (Int.repr v),(pa,(pb,parent)))) p *
    partial_tree_rep' a pa p * tree_rep' b pb p
 | HR a x v b => !! (Int.min_signed <= x <= Int.max_signed) &&
    EX pa:val, EX pb:val,
    data_at Tsh t_struct_tree (Vint (Int.repr x),(Vint (Int.repr v),(pa,(pb,parent)))) p *
    tree_rep' a pa p * partial_tree_rep' b pb p
 end.

(* put_tree_into_hole (T t1 k v t2) pt is valid *)
Fixpoint put_tree_into_hole_valid (k:key) (pt:partial_tree Z) :=
  match pt with
  | Hole => True
  | HL a k' v b => k < k' /\ put_tree_into_hole_valid k a
  | HR a k' v b => k > k' /\ put_tree_into_hole_valid k b
  end.
  
(* partial_tree_rep' is needed because
   where the "Hole" lies is not nullval, 
   but tree_rep' constrains it to be. *)
Lemma node_in_tree_rep_spec (t: tree Z)(BST: is_bst t) (root: val) (parent: val)(k: Z)(v: Z)(key: val) :
  lookup nonex k t <> nonex  ->
  node_in_tree_rep' t root parent k v key |--
  EX pt: partial_tree Z, EX t1:tree Z, EX t2: tree Z, EX parent':val,
  (partial_tree_rep' pt root parent) * 
  tree_rep' (T t1 k v t2) key parent'
  && !!(t = put_tree_into_hole (T t1 k v t2) pt)
  && !!(put_tree_into_hole_valid k pt).
Proof.
  revert root parent k v key. 
  induction t; intros; simpl.
  - unfold lookup in H. congruence.
  - destruct(k0=?k) eqn:eq.
    + Intros pa pb.
      Exists (@Hole Z) t1 t2 parent pa pb.
      rewrite Z.eqb_eq in eq.
      unfold partial_tree_to_tree. simpl.
      entailer!.
    + Intros pa pb.
      assert(k0<k\/k0>k). { rewrite Z.eqb_neq in eq. omega. }
      destruct H1.
      * rewrite lookup_left in H; auto.
        sep_apply IHt1.
        { apply is_bst_left in BST; auto. }
        Intros pt a b parent'.
        simpl.
        Intros pa' pb'.
        Exists (HL pt k v t2) a b parent' pa' pb'.
        entailer!.
        simpl; split; auto.
        simpl.
        Exists pa pb.
        entailer!.
        unfold partial_tree_to_tree.
        sep_apply node_in_tree_rep'_implies_tree_rep'.
        entailer!.
      * rewrite lookup_right in H; auto.
        sep_apply IHt2.
        { apply is_bst_right in BST; auto. }
        Intros pt a b parent'.
        simpl.
        Intros pa' pb'.
        Exists (HR t1 k v pt) a b parent' pa' pb'.
        entailer!.
        simpl; split; auto.
        simpl.
        Exists pa pb.
        entailer!.
        unfold partial_tree_to_tree.
        sep_apply node_in_tree_rep'_implies_tree_rep'.
        entailer!.
Qed.

Lemma node_in_tree_rep_spec_inv t (BST: is_bst t) pt t1 t2 root parent parent' k v key:
  put_tree_into_hole_valid k pt ->
  (t = put_tree_into_hole (T t1 k v t2) pt) ->
  partial_tree_rep' pt root parent * 
  tree_rep' (T t1 k v t2) key parent' |--
  node_in_tree_rep' (put_tree_into_hole (T t1 k v t2) pt) root parent k v key.
Proof.
  revert BST.
  revert t t1 t2 root parent parent' k v key.
  induction pt; intros.
  - (* FIXME: this means stricter constraint is needed. *)
    assert (key=root). { admit. }
    assert (parent=parent'). { admit. }
    subst.
    simpl.
    Intros pa pb.
    rewrite Z.eqb_refl.
    Exists pa pb.
    entailer!.
  - simpl partial_tree_rep'.
    simpl in H; destruct H.
    Intros pa pb.
    assert (data_at Tsh t_struct_tree
            (Vint (Int.repr k),
            (Vint (Int.repr v), (pa, (pb, parent)))) root *
            partial_tree_rep' pt pa root * tree_rep' t pb root *
            tree_rep' (T t1 k0 v0 t2) key parent' |-- 
            data_at Tsh t_struct_tree
            (Vint (Int.repr k),
            (Vint (Int.repr v), (pa, (pb, parent)))) root *
            (partial_tree_rep' pt pa root * 
            tree_rep' (T t1 k0 v0 t2) key parent') *
            tree_rep' t pb root ) by entailer!.
    sep_apply H3.
    sep_apply IHpt.
    { rewrite H0 in BST. apply is_bst_left in BST. auto. }
    simpl.
    assert(k0=?k=false). { rewrite Z.eqb_neq. omega. }
    rewrite H4.
    Exists pa pb.
    entailer!.
    apply node_in_tree_nonex.
    simpl in BST. apply is_bst_right in BST.
    auto.
  - simpl partial_tree_rep'.
    simpl in H; destruct H.
    Intros pa pb.
    sep_apply IHpt.
    { rewrite H0 in BST. apply is_bst_right in BST. auto. }
    simpl.
    assert(k0=?k=false). { rewrite Z.eqb_neq. omega. }
    rewrite H3.
    Exists pa pb.
    entailer!.
    apply node_in_tree_nonex.
    simpl in BST. apply is_bst_left in BST.
    auto.
Admitted.

(* Some easy helper lemmas *)
Lemma tree_nullval : forall t par, tree_rep' t nullval par |-- !!(t = E).
Proof.
  intros. destruct t.
  - simpl. entailer!.
  - simpl. Intros pa pb. entailer!.
Qed.

Lemma node_in_tree_nonempty : forall t r par k v key, lookup nonex k t <> nonex ->
  node_in_tree_rep' t r par k v key |-- !!(t <> E).
Proof.
  intros. destruct t.
  - simpl. entailer!.
  - entailer!. discriminate.
Qed.

Lemma node_in_tree_nullval : forall t par k v key,
  node_in_tree_rep' t nullval par k v key |-- !!(t = E).
Proof.
  intros. destruct t.
  - simpl. entailer!.
  - simpl. destruct (k=?k0); Intros pa pb; entailer!.
Qed.


(* Here are some lemmas to avoid pointer validity check. 
   Some of them may be redundant though. *)
Lemma tree_rep'_saturate_local:
   forall t p par, tree_rep' t p par |-- !! is_pointer_or_null p.
Proof.
  intros. 
  destruct t; simpl.
  - entailer!.
  - Intros pa pb. entailer!. 
Qed.
Hint Resolve tree_rep'_saturate_local: saturate_local.

Lemma tree_rep'_valid_pointer:
  forall t p par, tree_rep' t p par |-- valid_pointer p.
Proof.
  intros.
  destruct t; simpl.
  - entailer!.
  - entailer!. auto with valid_pointer.
Qed.
Hint Resolve tree_rep'_valid_pointer: valid_pointer.

Lemma tree_rep_saturate_local:
   forall t p, tree_rep t p |-- !! is_pointer_or_null p.
Proof.
  intros. unfold tree_rep. entailer.
Qed.
Hint Resolve tree_rep_saturate_local: saturate_local.

Lemma tree_rep_valid_pointer:
  forall t p, tree_rep t p |-- valid_pointer p.
Proof.
  intros. unfold tree_rep. entailer.
Qed.
Hint Resolve tree_rep_valid_pointer: valid_pointer.

Lemma node_in_tree_rep'_saturate_local_p:
   forall t r pa k v p,
   !! (lookup nonex k t <> nonex) && node_in_tree_rep' t r pa k v p |-- 
   !! is_pointer_or_null p.
Proof.
  intros t.
  induction t; intros; simpl.
  - entailer!.
  - destruct (k0=?k) eqn : eq.
    + Intros p1 p2. entailer!.
    + Intros p1 p2. destruct (k0<?k) eqn : eq1.
      * unfold lookup in H. rewrite eq1 in H.
        sep_apply IHt1; auto. 
        entailer!.
      * unfold lookup in H. rewrite eq1 in H.
        apply Z.eqb_neq in eq. apply Z.ltb_nlt in eq1.
        assert (k<?k0=true) by (apply Z.ltb_lt; omega).
        rewrite H1 in H.
        sep_apply IHt2; auto.
        entailer!.
Qed.      
Hint Resolve node_in_tree_rep'_saturate_local_p: saturate_local.

Lemma node_in_tree_rep_saturate_local_p:
   forall t r k v p, node_in_tree_rep t r k v p |-- 
   !! is_pointer_or_null p.
Proof.
  intros. unfold node_in_tree_rep. Intros.
  eapply derives_trans.
  2: sep_apply (node_in_tree_rep'_saturate_local_p t r nullval k v p); auto; entailer!.
  apply derives_refl.
Qed. 
Hint Resolve node_in_tree_rep_saturate_local_p: saturate_local.

Lemma node_in_tree_rep'_valid_pointer_p:
   forall t r pa k v p,
   !! (lookup nonex k t <> nonex) && node_in_tree_rep' t pa r k v p |-- 
   valid_pointer p.
Proof.
  intros t.
  induction t; intros; simpl.
  - entailer!.
  - destruct (k0=?k) eqn : eq.
    + Intros p1 p2. entailer!.
    + Intros p1 p2. destruct (k0<?k) eqn : eq1; unfold lookup in H; rewrite eq1 in H.
      * sep_apply IHt1; auto.
        entailer!.
      * apply Z.eqb_neq in eq. apply Z.ltb_nlt in eq1.
        assert (k<?k0=true) by (apply Z.ltb_lt; omega).
        rewrite H1 in H.
        sep_apply IHt2; auto.
        entailer!.
Qed.
Hint Resolve node_in_tree_rep'_valid_pointer_p: valid_pointer.

Lemma node_in_tree_rep_valid_pointer_p:
  forall t r k v p, node_in_tree_rep t r k v p |-- 
  valid_pointer p.
Proof.
  intros. unfold node_in_tree_rep. auto with valid_pointer.
Qed. 
Hint Resolve node_in_tree_rep_valid_pointer_p: valid_pointer.

Lemma node_in_tree_rep'_saturate_local_r:
   forall t r pa k v p, node_in_tree_rep' t r pa k v p |-- 
   !! is_pointer_or_null r.
Proof.
  intros. destruct t; simpl.
  - entailer.
  - destruct (k=?k0);
    Intros p1 p2; entailer!.
Qed. 
Hint Resolve node_in_tree_rep'_saturate_local_r: saturate_local.

Lemma node_in_tree_rep_saturate_local_r:
   forall t r k v p, node_in_tree_rep t r k v p |-- 
   !! is_pointer_or_null r.
Proof.
  intros. unfold node_in_tree_rep. entailer.
Qed. 
Hint Resolve node_in_tree_rep_saturate_local_r: saturate_local.

Lemma node_in_tree_rep'_valid_pointer_r:
   forall t r pa k v p, node_in_tree_rep' t r pa k v p |-- 
   valid_pointer r.
Proof.
  intros. destruct t; simpl.
  - entailer.
  - destruct (k=?k0);
    Intros p1 p2; entailer!.
Qed. 
Hint Resolve node_in_tree_rep'_valid_pointer_r: valid_pointer.

Lemma node_in_tree_rep_valid_pointer_r:
   forall t r k v p, node_in_tree_rep t r k v p |-- 
   valid_pointer r.
Proof.
  intros. unfold node_in_tree_rep. entailer.
Qed. 
Hint Resolve node_in_tree_rep_valid_pointer_r: valid_pointer.