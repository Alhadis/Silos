Require Import VST.floyd.proofauto.
Require Import VerifyBST.prog.BST.
Require Import VerifyBST.bst_model.
Require Import VerifyBST.bst_sep.
Require Import VerifyBST.bst_spec.

Lemma body_set_by_key: semax_body Vprog Gprog f_set_by_key set_by_key_spec.
Proof.
  start_function.
  forward_if.
  - subst r. sep_apply tree_nullval.
    forward.
  - destruct t.
    { simpl. Intros. congruence. }
    simpl. Intros pa pb.
    forward.
    (* don't know why forward_if doesn't work here *)
    forward_if(
        PROP()
        LOCAL()
        SEP (tree_rep' (insert k v (T t1 k0 z t2)) r parent)). 
    3: forward.
    + forward. 
      subst.
      rewrite insert_hit.
      entailer. simpl.
      Exists pa pb.
      entailer!.
    + forward. forward_if.
      * forward.
        rewrite lookup_left in H0; auto.
        forward_call (pa, r, k, v, t1).
        rewrite insert_left; auto.
        entailer. simpl. Exists pa pb.
        entailer!.
      * forward. assert(k>k0) by omega.
        rewrite lookup_right in H0; auto.
        forward_call (pb, r, k, v, t2).
        rewrite insert_right; auto.
        entailer. simpl. Exists pa pb.
        entailer!.
Qed.

(* 
(* not used ? *)
Lemma insert_lookup k t: 
  lookup nonex k t <> nonex ->
  insert k (lookup nonex k t) t = t.
Proof.
  intros.
  induction t.
  - unfold lookup in H. congruence.
  - assert(k=k0\/k<k0\/k>k0) by omega. destruct H0 as [|[|]].
    + subst. rewrite lookup_hit. rewrite insert_hit.
      reflexivity.
    + rewrite lookup_left in *; auto.
      rewrite insert_left; auto.
      rewrite IHt1; auto.
    + rewrite lookup_right in *; auto.
      rewrite insert_right; auto.
      rewrite IHt2; auto.
Qed.
*)

Lemma lookup_insert k v t: lookup nonex k (insert k v t) = v.
Proof.
  induction t.
  - simpl. unfold lookup. rewrite Z.ltb_irrefl. auto.
  - assert(k=k0\/k<k0\/k>k0) by omega. destruct H as [|[|]].
    + subst. rewrite insert_hit. rewrite lookup_hit.
      reflexivity.
    + rewrite insert_left; auto.
      rewrite lookup_left; auto.
    + rewrite insert_right; auto.
      rewrite lookup_right; auto.
Qed.

Lemma insert_hole t' t1 t2 k (v0 v:Z): 
  put_tree_into_hole_valid k t' ->
  put_tree_into_hole (T t1 k v t2) t' = 
  insert k v (put_tree_into_hole (T t1 k v0 t2) t').
Proof.
  intros. revert H. revert t1 t2 k v0 v.
  induction t'; intros; simpl in H; destruct H.
  - simpl in *.
    rewrite Z.ltb_irrefl.
    auto.
  - simpl put_tree_into_hole.
    rewrite insert_left; auto.
    simpl. 
    f_equal.
    apply IHt'; auto.
  - simpl put_tree_into_hole.
    rewrite insert_right; auto.
    simpl. 
    f_equal.
    apply IHt'; auto.
Qed.

Lemma body_set_by_addr: semax_body Vprog Gprog f_set_by_addr set_by_addr_spec.
Proof.
  start_function.
  (* don't know why forward_if doesn't work here *)
  forward_if(
      PROP()
      LOCAL()
      SEP (node_in_tree_rep (insert k v t) r k v p));
  [ | congruence | forward].
  unfold node_in_tree_rep. Intros.
  sep_apply node_in_tree_rep_spec. Intros t' t1 t2 parent'.
  simpl. Intros pa pb.
  forward.
  unfold node_in_tree_rep. autorewrite with norm.
  assert (data_at Tsh t_struct_tree
      (Vint (Int.repr k), (Vint (Int.repr v), (pa, (pb, parent')))) p*
      tree_rep' t1 pa p* tree_rep' t2 pb p |-- 
      tree_rep' (T t1 k v t2) p parent').
  { simpl. Exists pa pb. entailer!. }
  sep_apply H9.
  assert( put_tree_into_hole (T t1 k v t2) t' = (insert k v t)).
  { rewrite (insert_hole _ _ _ _ v0); auto. rewrite H7. auto. }
  sep_apply node_in_tree_rep_spec_inv;
  rewrite H10.
  { apply is_bst_insert; auto. }
  rewrite lookup_insert.
  entailer!.
Qed.