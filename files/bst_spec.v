Require Import VST.floyd.proofauto.
Require Import VerifyBST.prog.BST.
Require Import VerifyBST.bst_model.
Require Import VerifyBST.bst_sep.

Definition malloc_spec :=
 DECLARE _malloc
  WITH n: Z
  PRE [ 1%positive OF tuint]
     PROP (4 <= n <= Int.max_unsigned)
     LOCAL (temp 1%positive (Vint (Int.repr n)))
     SEP ()
  POST [ tptr tvoid ]
     EX v: val,
     PROP (malloc_compatible n v)
     LOCAL (temp ret_temp v)
     SEP (memory_block Tsh n v).

Definition insert_spec :=
 DECLARE _insert
  WITH r: val, r': val, parent: val, k: Z, v: Z, t: tree Z
  PRE  [ _root OF (tptr (tptr t_struct_tree)), 
         _k OF tint, _v OF tint ]
    PROP( Int.min_signed <= k <= Int.max_signed)
    LOCAL(temp _root r; temp _k (Vint (Int.repr k)); temp _v (Vint (Int.repr v)))
    SEP (data_at Tsh (tptr t_struct_tree) r' r *
         tree_rep' t r' parent)
  POST [ Tvoid ] 
    PROP()
    LOCAL()
    SEP (if eq_dec r' nullval then
           EX r'':val,
           data_at Tsh (tptr t_struct_tree) r'' r *
           tree_rep' (insert k v t) r'' nullval
         else
           data_at Tsh (tptr t_struct_tree) r' r *
           tree_rep' (insert k v t) r' parent).

Definition query_value_spec :=  
 DECLARE _query_value 
  WITH r: val, parent: val, k: Z, t: tree Z
  PRE  [ _root OF (tptr t_struct_tree), _k OF tint ] 
    PROP( Int.min_signed <= k <= Int.max_signed)
    LOCAL(temp _root r; temp _k (Vint (Int.repr k)))
    SEP (tree_rep' t r parent)
  POST [ tint ]
    PROP()
    LOCAL(temp ret_temp (Vint (Int.repr (lookup nonex k t))))
    SEP (tree_rep' t r parent).

Definition query_addr_spec :=  
 DECLARE _query_addr 
  WITH r: val, parent: val, k: Z, t: tree Z, v: Z, addr: val
  PRE  [ _root OF (tptr t_struct_tree), _k OF tint ] 
    PROP(Int.min_signed <= k <= Int.max_signed; v=(lookup nonex k t); v<>nonex )
    LOCAL(temp _root r; temp _k (Vint (Int.repr k)))
    SEP (node_in_tree_rep' t r parent k v addr)
  POST [ tptr t_struct_tree ]
    PROP()
    LOCAL(temp ret_temp addr)
    SEP (node_in_tree_rep' t r parent k v addr).

Definition set_by_key_spec :=
 DECLARE _set_by_key 
  WITH r: val, parent:val, k: Z, v: Z, t: tree Z 
  PRE  [ _root OF (tptr t_struct_tree), _k OF tint, _v OF tint ] 
    PROP(Int.min_signed <= k <= Int.max_signed;
         lookup nonex k t <> nonex)  (* precondition: key must exist in the tree*)
    LOCAL(temp _root r; temp _k (Vint (Int.repr k)); temp _v (Vint (Int.repr v)))
    SEP (tree_rep' t r parent)
  POST [ tvoid ]
    PROP()
    LOCAL()
    SEP (tree_rep' (insert k v t) r parent).

Definition set_by_addr_spec :=
 DECLARE _set_by_addr 
  WITH p: val, r: val,
       v: Z, v0:Z,  k: Z, t: tree Z 
  PRE  [ _p OF (tptr t_struct_tree), _v OF tint ] 
    PROP( lookup nonex k t =v0; v0<>nonex; v<>nonex;
          p <> nullval; is_bst t )
    LOCAL(temp _p p; temp _v (Vint (Int.repr v)))
    SEP (node_in_tree_rep t r k v0 p)
  POST [ tvoid ]
    PROP()
    LOCAL()
    SEP (node_in_tree_rep (insert k v t) r k v p).

(* FIXME : not consider return NULL *)
(* XXX : it seems the cases for NULL are so simple that 
         it is unnecessary to verify them formally. *)

Definition next_spec :=
 DECLARE _next
  WITH current: val, r:val, ret:val, k: Z, t: tree Z 
  PRE  [ _current OF (tptr t_struct_tree)] 
    PROP(tree_next nullkey k t <> nullkey)
    LOCAL(temp _current current)
    SEP (EX v: Z, node_in_tree_rep t r k v current)
  POST [ tptr t_struct_tree ]
    PROP()
    LOCAL(temp ret_temp ret)
    SEP (EX v': Z, node_in_tree_rep t r (tree_next nullkey k t) v' ret).

Definition prev_spec :=
 DECLARE _prev
  WITH current: val, r:val, ret:val, k: Z, t: tree Z 
  PRE  [ _current OF (tptr t_struct_tree)] 
    PROP(tree_prev nullkey k t <> nullkey)
    LOCAL(temp _current current)
    SEP (EX v: Z, node_in_tree_rep t r k v current)
  POST [ tptr t_struct_tree ]
    PROP()
    LOCAL(temp ret_temp ret)
    SEP (EX v': Z, node_in_tree_rep t r (tree_prev nullkey k t) v' ret).
    
Definition end_spec :=
 DECLARE _end
  WITH r: val, parent: val, ret: val, t: tree Z, v: Z
  PRE  [ _root OF (tptr t_struct_tree)] 
    PROP(t <> E; no_duplicate_key_in_tree t)
    LOCAL(temp _root r)
    SEP (node_in_tree_rep' t r parent (tree_end nullkey t) v ret)
  POST [ tptr t_struct_tree ]
    PROP()
    LOCAL(temp ret_temp ret)
    SEP (node_in_tree_rep' t r parent (tree_end nullkey t) v ret).

Definition begin_spec :=
 DECLARE _begin
  WITH r: val, parent: val, ret: val, t: tree Z, v: Z
  PRE  [ _root OF (tptr t_struct_tree)] 
    PROP(t <> E; no_duplicate_key_in_tree t)
    LOCAL(temp _root r)
    SEP (node_in_tree_rep' t r parent (tree_begin nullkey t) v ret)
  POST [ tptr t_struct_tree ]
    PROP()
    LOCAL(temp ret_temp ret)
    SEP (node_in_tree_rep' t r parent (tree_begin nullkey t) v ret).

Definition Gprog : funspecs :=
    ltac:(with_library prog [
    malloc_spec;
    insert_spec; 
    query_value_spec; query_addr_spec;
    set_by_key_spec; set_by_addr_spec;
    next_spec; prev_spec; begin_spec; end_spec
  ]).
