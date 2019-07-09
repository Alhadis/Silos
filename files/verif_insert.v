Require Import VST.floyd.proofauto.
Require Import VerifyBST.prog.BST.
Require Import VerifyBST.bst_model.
Require Import VerifyBST.bst_sep.
Require Import VerifyBST.bst_spec.

Lemma body_insert: semax_body Vprog Gprog f_insert insert_spec.
Proof.
  start_function.
  Intros.
  forward. 
  forward_if.
  - (* empty root *)
    subst r'. sep_apply tree_nullval. 
    Intros. subst. simpl. Intros.
    (* don't know why forward_call (sizeof t_struct_tree) fails here. *)
    forward_call 20; [rep_omega | ].
    assert(sizeof t_struct_tree=20) by auto.
    rewrite <- H0.
    Intros vret.
    rewrite memory_block_data_at_ by auto.
    (* 13 forward here , so it will be long ... *)
    repeat forward. 
    simpl. 
    Exists vret nullval nullval. 
    entailer!.
  - (* nonempty *)
    forward.
    destruct t.
    { simpl. Intros. congruence. }
    simpl. Intros pa pb.
    forward.
    (* don't know why forward_if fails here. *)
    forward_if 
      (PROP ( )
       LOCAL ()
       SEP (data_at Tsh (tptr t_struct_tree) r' r *
            tree_rep' (insert k v (T t1 k0 z t2)) r' parent)).
    3:{ forward. destruct (eq_dec r' nullval); [congruence|apply derives_refl]. }
    + (* modify the root node directly *)
      forward.
      forward.
      subst k0.
      rewrite insert_hit.
      entailer. simpl.
      Exists pa pb.
      entailer!.
    + forward.
      forward.
      forward_if.
      * (* go left *)
        forward.
        forward.
        forward_if.
       -- (* left is empty *)
          forward_call 20; [rep_omega | ].
          assert(sizeof t_struct_tree=20) by auto.
          rewrite <- H5.
          Intros vret.
          rewrite memory_block_data_at_ by auto.
          (* 19 forward here, so it will be even longer ... *)
          repeat forward.
          entailer.
          sep_apply tree_nullval. Intros. subst t1.
          rewrite insert_left; auto. simpl.
          Exists vret pb nullval nullval.
          entailer!.
       -- (* left is nonempty *)
          forward.
          assert_PROP (offset_val 8 r' = field_address t_struct_tree [StructField _left] r').
          { entailer!. rewrite field_address_offset. 
            auto. auto with field_compatible. }
          forward_call (field_address t_struct_tree [StructField _left] r', pa, r', k, v, t1).
          { unfold_data_at (data_at Tsh t_struct_tree _ r').
            entailer!. }
          { destruct (eq_dec pa nullval); [congruence|].
            rewrite insert_left; auto.
            entailer. simpl.
            Exists pa pb.
            autorewrite with norm.
            unfold_data_at (data_at Tsh t_struct_tree _ r').
            entailer!. }
      * (* go right *)
        forward.
        forward.
        forward_if.
       -- (* right is empty *)
          forward_call 20; [rep_omega | ].
          assert(sizeof t_struct_tree=20) by auto.
          rewrite <- H5.
          Intros vret.
          rewrite memory_block_data_at_ by auto.
          (* 19 forward here, so it will still be very long ... *)
          repeat forward.
          entailer.
          sep_apply tree_nullval. Intros. subst t2.
          rewrite insert_right; [|omega]. simpl. 
          Exists pa vret nullval nullval.
          entailer!.
       -- (* right is nonempty *)
          forward.
          assert_PROP (offset_val 12 r' = field_address t_struct_tree [StructField _right] r').
          { entailer!. rewrite field_address_offset. 
            auto. auto with field_compatible. }
          forward_call (field_address t_struct_tree [StructField _right] r', pb, r', k, v, t2).
          { unfold_data_at (data_at Tsh t_struct_tree _ r').
            entailer!. }
          { destruct (eq_dec pb nullval); [congruence|].
            rewrite insert_right; try omega.
            entailer. simpl.
            Exists pa pb.
            autorewrite with norm.
            unfold_data_at (data_at Tsh t_struct_tree _ r').
            entailer!. }
Qed.