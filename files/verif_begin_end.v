Require Import VST.floyd.proofauto.
Require Import VerifyBST.prog.BST.
Require Import VerifyBST.bst_model.
Require Import VerifyBST.bst_sep.
Require Import VerifyBST.bst_spec.

(* 
node *begin(node *root)
{
    if(root == NULL) {
        return NULL;
    } else if(root->left == NULL) {
        return root;
    } else {
        return begin(root->left);
    }
}
*)

Lemma hd_app:
  forall (V: Type )(la lb: list V) k, (la <> nil) ->
  (hd k la ) = (hd k (la++lb) ).
Proof.
  intros.
  induction la.
  + exfalso; apply H; reflexivity.
  + reflexivity.
Qed.

Lemma last_app:
  forall (V: Type) (la lb: list V) k, (lb <> nil) ->
  (last lb k) = (last (la++lb) k).
Proof.
  intros.
  induction la.
  + reflexivity.
  + rewrite <- app_comm_cons.
     rewrite IHla.
     assert ((la ++ lb) <> []).
     {
       unfold not; intros.
       apply app_eq_nil in H0.
       destruct H.
       destruct H0.
       auto.
     }
     destruct (la ++ lb).
     { exfalso; apply H0; reflexivity. }
     reflexivity.
Qed.

Lemma tree_begin_in_the_left_tree:
  forall (t1 t2: tree Z) k z,
  (t1 <> E) ->
  (tree_begin nullkey (T t1 k z t2) = (tree_begin nullkey t1)).
Proof.
  intros.
  destruct t1.
  + exfalso; apply H; reflexivity.
  + unfold tree_begin.
    simpl.
    unfold begin.
    pose proof map_app fst  (elements Z t1_1 ++ (k0, z0) :: elements Z t1_2) ((k, z) :: elements Z t2).
    rewrite H0.
    apply eq_sym; apply hd_app.
    unfold not; intros.
    apply map_eq_nil in H1.
    apply app_eq_nil in H1.
    destruct H1.
    discriminate H2.
Qed.

Lemma tree_end_in_the_right_tree:
  forall (t1 t2: tree Z) k z,
  (t2 <> E) ->
  (tree_end nullkey (T t1 k z t2) = (tree_end nullkey t2)).
Proof.
  intros.
  destruct t2.
  + exfalso; apply H; reflexivity.
  + unfold tree_end.
    simpl.
    unfold eend.
    rewrite map_app.
    rewrite <- last_app.
    2: { simpl. unfold not; intros; discriminate. }
    rewrite map_cons.
    remember (map fst (elements Z t2_1 ++ (k0, z0) :: elements Z t2_2)) as l.
    unfold fst.
    assert (l <> []).
    { unfold not; intros.
      rewrite map_app in Heql.
      simpl in Heql.
      subst.
      apply app_eq_nil in H0.
      destruct H0.
      discriminate.
    }
    destruct l.
    { exfalso; apply H0; reflexivity. }
    reflexivity.
Qed.

Lemma tree_begin_is_the_root:
  forall (r parent pb: val) k v (t2: tree Z) ,
(Int.min_signed <= k <= Int.max_signed) -> (data_at Tsh t_struct_tree (Vint (Int.repr k), (Vint (Int.repr v), (nullval, (pb, parent)))) r * tree_rep' t2 pb r)
|-- node_in_tree_rep' (T E k v t2) r parent (tree_begin nullkey (T E k v t2)) v r.
Proof.
  intros.
  unfold tree_begin, begin.
  simpl.
  assert ((k =? k) = true).
  { apply Z.eqb_refl. }
  rewrite H0.
  Exists nullval  pb.
  entailer!.
Qed.

Lemma tree_end_is_the_root:
  forall (r parent pa: val) k v (t1: tree Z) ,
(Int.min_signed <= k <= Int.max_signed) -> (data_at Tsh t_struct_tree (Vint (Int.repr k), (Vint (Int.repr v), (pa, (nullval, parent)))) r * tree_rep' t1 pa r)
|-- node_in_tree_rep' (T t1 k v E) r parent (tree_end nullkey (T t1 k v E)) v r.
Proof.
  intros.
  unfold tree_end, eend.
  simpl.
  rewrite map_app, <- last_app.
  simpl.
  assert ((k =? k) = true) by apply Z.eqb_refl.
  rewrite H0.
  2: { simpl. unfold not; intros; discriminate. }
  Exists pa nullval.
  entailer!.
Qed.

Lemma NoDup_app:
  forall (V: Type) (l1 l2: list V),
    NoDup (l1 ++ l2) -> (NoDup l1 /\ NoDup l2).
Proof.
  intros.
  induction l2.
  + rewrite app_nil_r in H.
    split; [auto | apply NoDup_nil ].
  + apply NoDup_remove in H; destruct H as [Me Coq].
    apply IHl2 in Me; destruct Me as [Love Peace].
    split. { exact Love. }
    apply NoDup_cons.
    - rewrite in_app in Coq; auto.
    - exact Peace.
Qed.

Lemma tree_begin_not_the_root:
  forall (t1 t2: tree Z) k z, (t1 <> E) -> (no_duplicate_key_in_tree (T t1 k z t2))
  ->  (tree_begin nullkey (T t1 k z t2) <> k).
Proof.
  intros.
  destruct t1.
  { auto. }
  pose proof (tree_begin_in_the_left_tree (T t1_1 k0 z0 t1_2) t2 k z H).
  unfold not; intros.
  unfold no_duplicate_key_in_tree, no_duplicate_key_in_list in H0.
  rewrite H1 in H2.
  assert (In k (map fst (elements Z (T t1_1 k0 z0 t1_2)))).
  {
    unfold tree_begin, begin in H2.
    remember (map fst (elements Z (T t1_1 k0 z0 t1_2))) as key_list.
    subst k.
    unfold hd.
    destruct key_list.
    + simpl in Heqkey_list.
      rewrite map_app in Heqkey_list.
      rewrite map_cons in Heqkey_list.
      apply eq_sym in Heqkey_list.
      apply app_eq_nil in Heqkey_list; destruct Heqkey_list as [Coq Me].
      discriminate Me.
    + apply in_eq.
  }
  simpl in H0, H3.
  rewrite map_app in H0 at 1.
  remember (map fst (elements Z t1_1 ++ (k0, z0) :: elements Z t1_2)) as left_keys.
  rewrite map_cons in H0; simpl in H0.
  remember (map fst (elements Z t2)) as right_keys.
  apply NoDup_remove_2 in H0.
  rewrite in_app in H0.
  destruct H0.
  left.
  auto.
Qed.

Lemma last_eq_rev_hd:
  forall (V: Type) (l: list V) (d: V),
    (last l d) = (hd d (rev l)).
Proof.
  intros.
  revert l.
  induction l.
  + reflexivity.
  + destruct l.
    - reflexivity.
    - simpl; simpl in IHl.
      rewrite <- hd_app.
      2: { simpl. unfold not; intros. 
           apply app_eq_nil in H.
           destruct H.
           discriminate.
         }
     rewrite IHl.
     reflexivity.
Qed.

Lemma tree_end_not_the_root:
  forall (t1 t2: tree Z) k z, (t2 <> E) -> (no_duplicate_key_in_tree (T t1 k z t2))
  ->  (tree_end nullkey (T t1 k z t2) <> k).
Proof.
  intros.
  destruct t2.
  { auto. }
  pose proof (tree_end_in_the_right_tree t1 (T t2_1 k0 z0 t2_2) k z H).
  unfold not; intros.
  unfold no_duplicate_key_in_tree, no_duplicate_key_in_list in H0.
  rewrite H1 in H2.
  assert (In k (map fst (elements Z (T t2_1 k0 z0 t2_2)))).
  {
    unfold tree_end, eend in H2.
    remember (map fst (elements Z (T t2_1 k0 z0 t2_2))) as key_list.
    subst k.
    unfold hd.
    rewrite last_eq_rev_hd.
    apply in_rev.
    remember (rev key_list) as rev_key_list.
    destruct rev_key_list.
    + simpl in Heqkey_list.
      rewrite map_app in Heqkey_list.
      rewrite map_cons in Heqkey_list.
      apply eq_sym in Heqkey_list.
      rewrite <- Heqkey_list in Heqrev_key_list.
      rewrite rev_app_distr in Heqrev_key_list.
      simpl in Heqrev_key_list.
      apply eq_sym in Heqrev_key_list.
      apply app_eq_nil in Heqrev_key_list; destruct Heqrev_key_list.
      apply app_eq_nil in H2; destruct H2.
      discriminate H4.
    + apply in_eq.
  }
  simpl in H0, H3.
  rewrite map_app in H0 at 1.
  remember (map fst (elements Z t2_1 ++ (k0, z0) :: elements Z t2_2)) as right_keys.
  rewrite map_cons in H0; simpl in H0.
  remember (map fst (elements Z t1)) as left_keys.
  rewrite <- Heqright_keys in H0.
  apply NoDup_remove_2 in H0. 
  rewrite in_app in H0.
  destruct H0.
  right.
  auto.
Qed.

Lemma node_in_left_tree_in_the_tree:
  forall (parent r pa pb: val) (t1 t2: tree Z) k v ret kk zz,
  (Int.min_signed <= kk <= Int.max_signed) -> (t1 <> E) ->
  (no_duplicate_key_in_tree (T t1 kk zz t2)) ->
  ((node_in_tree_rep' t1 pa r k v ret) * (tree_rep' t2 pb r) *
(data_at Tsh t_struct_tree (Vint (Int.repr kk), (Vint (Int.repr zz), (pa, (pb, parent)))) r))
|-- (node_in_tree_rep' (T t1 kk zz t2) r parent k v ret).
Proof.
  intros.
  (* FIXME
     Can I prove this?
  *)
Admitted.

Lemma node_in_right_tree_in_the_tree:
  forall (parent r pa pb: val) (t1 t2: tree Z) k v ret kk zz,
  (Int.min_signed <= kk <= Int.max_signed) -> (t2 <> E) ->
  (no_duplicate_key_in_tree (T t1 kk zz t2)) ->
  ((node_in_tree_rep' t2 pb r k v ret) * (tree_rep' t1 pa r) *
(data_at Tsh t_struct_tree (Vint (Int.repr kk), (Vint (Int.repr zz), (pa, (pb, parent)))) r))
|-- (node_in_tree_rep' (T t1 kk zz t2) r parent k v ret).
Proof.
  intros.
  (* FIXME
     Can I prove this?
  *)
Admitted.

Lemma no_duplicate_key_in_subtree:
  forall k v (left_tree right_tree: tree Z), 
    (no_duplicate_key_in_tree (T left_tree k v right_tree))
    -> ( (no_duplicate_key_in_tree left_tree) /\ (no_duplicate_key_in_tree right_tree) ).
Proof.
  unfold no_duplicate_key_in_tree, no_duplicate_key_in_list.
  simpl; intros.
  rewrite map_app, map_cons in H; simpl in H.
  remember (map fst (elements Z left_tree) ) as lefy_keys.
  remember (map fst (elements Z right_tree)) as right_keys.
  apply NoDup_remove_1 in H.
  apply NoDup_app.
  auto.
Qed.

Lemma body_begin: semax_body Vprog Gprog f_begin begin_spec.
Proof.
  start_function.
  forward_if.
  + (* root == NULL *)
    forward.
    sep_apply node_in_tree_nullval.
    entailer!.
  + (* root != NULL *)
    destruct t.
    - (* t == E *)
      exfalso; apply H; reflexivity. 
    - (* t == T t1 k z t2 *)
      unfold node_in_tree_rep, node_in_tree_rep', tree_rep'.
      simpl.
      fold tree_rep' node_in_tree_rep' node_in_tree_rep.
      destruct t1.
      * (* t1 == E*)
        unfold tree_begin, elements, begin.
        simpl.
        assert (k =? k = true) as CoqLovesMe by (apply Z.eqb_refl);
        rewrite CoqLovesMe; clear CoqLovesMe.
        Intros pa pb.
        subst.
        forward.
        forward_if.
        ++ (* root -> left == NULL *)
            forward.
            sep_apply (tree_begin_is_the_root r parent pb k v t2).
            entailer!.
        ++ (* root -> left != NULL "this branch is impossible" *)
            discriminate.
      * (* t1 != E *)
        assert ((T t1_1 k0 z0 t1_2) <> E) as ILoveCoq by discriminate.
        pose proof tree_begin_in_the_left_tree (T t1_1 k0 z0 t1_2) t2 k z ILoveCoq as Hsub.
        pose proof tree_begin_not_the_root (T t1_1 k0 z0 t1_2) t2 k z ILoveCoq H0 as Hroot.
        clear ILoveCoq.
        apply Z.eqb_neq in Hroot; rewrite Hroot.
        Intros pa pb.
        forward.
        forward_if.
        ++ (* root -> left == NULL "this branch is impossible" *)
           subst.
           sep_apply node_in_tree_nullval.
           Intros.
        ++ (* root -> left != NULL *)
           forward.
           forward_call (pa, r, ret, (T t1_1 k0 z0 t1_2), v).
           -- (* PRE: SEP *)
              entailer!.
              rewrite Hsub.
              cancel.
           -- (* PRE: PROP *)
              split.
              { discriminate. }
              pose proof no_duplicate_key_in_subtree _ _ _ _ H0 as Hnodup.
              destruct Hnodup; auto.
           -- (* After calling *)
              forward.
              rewrite Hsub.
              sep_apply (node_in_tree_rep'_implies_tree_rep' t2).
              assert (T t1_1 k0 z0 t1_2 <> E) by discriminate.
              sep_apply (node_in_left_tree_in_the_tree parent r pa pb (T t1_1 k0 z0 t1_2) t2 (tree_begin nullkey (T t1_1 k0 z0 t1_2)) v ret k z).
              entailer!.
Qed.

Lemma body_end: semax_body Vprog Gprog f_end end_spec.
(* basicly proved in the same way as body_begin, 
    except for some differences in  details *)
Proof.
  start_function.
  forward_if.
  + (* root == NULL *)
    forward.
    sep_apply (node_in_tree_nullval).
    entailer!.
  + (* root != NULL *)
    destruct t.
    - (* t == E *)
      exfalso; apply H; reflexivity. 
    - (* t == T t1 k z t2 *)
      unfold node_in_tree_rep, node_in_tree_rep', tree_rep'.
      simpl.
      fold tree_rep' node_in_tree_rep' node_in_tree_rep.
      destruct t2.
      * (* t2 == E*)
        unfold tree_end, eend.
        simpl.
        rewrite map_app.
        rewrite <- last_app.
        2: { simpl. unfold not; intros; discriminate. }
        simpl.
        assert (k =? k = true) as CoqLovesMe by (apply Z.eqb_refl);
        rewrite CoqLovesMe; clear CoqLovesMe.
        Intros pa pb.
        subst.
        forward.
        forward_if.
        ++ (* root -> right == NULL *)
            forward.
            sep_apply (tree_end_is_the_root r parent pa k v t1).
            entailer!.
        ++ (* root -> right != NULL "this branch is impossible" *)
            discriminate.
      * (* t2 != E *)
        assert ((T t2_1 k0 z0 t2_2) <> E) as ILoveCoq by discriminate.
        pose proof tree_end_in_the_right_tree t1 (T t2_1 k0 z0 t2_2) k z ILoveCoq as Hsub.
        pose proof tree_end_not_the_root t1 (T t2_1 k0 z0 t2_2) k z ILoveCoq H0 as Hroot.
        clear ILoveCoq.
        apply Z.eqb_neq in Hroot; rewrite Hroot.
        Intros pa pb.
        forward.
        forward_if.
        ++ (* root -> right == NULL "this branch is impossible" *)
           subst.
           sep_apply node_in_tree_nullval.
           Intros.
        ++ (* root -> right != NULL *)
           forward.
           forward_call (pb, r, ret, (T t2_1 k0 z0 t2_2), v).
           -- (* PRE: SEP *)
              entailer!.
              rewrite Hsub.
              cancel.
           -- (* PRE: PROP *)
              split.
              { discriminate. }
              pose proof no_duplicate_key_in_subtree _ _ _ _ H0 as Hnodup.
              destruct Hnodup; auto.
           -- (* After calling *)
              forward.
              rewrite Hsub.
              sep_apply (node_in_tree_rep'_implies_tree_rep' t1).
              assert (T t2_1 k0 z0 t2_2 <> E) by discriminate.
              sep_apply (node_in_right_tree_in_the_tree parent r pa pb t1 (T t2_1 k0 z0 t2_2) (tree_end nullkey (T t2_1 k0 z0 t2_2)) v ret k z).
              entailer!.
Qed.