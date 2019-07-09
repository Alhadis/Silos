Require Import Gc.Util.
Require Import Bool Arith String List ListSet Vector CpdtTactics.

(** model pointers as nats *)
Definition ptr := nat.
Definition ptr_eq_dec := eq_nat_dec.

(** model vars as nats too, a bit silly so probably change later *)
Definition var := string.
Definition var_eq_dec := string_dec.

Definition var_ptr_eq_dec : forall (l r: var * ptr), {l = r} + {l <> r}.
  Hint Resolve ptr_eq_dec var_eq_dec.
  decide equality.
Qed.

(** Types of values we can have in the heap *)
Inductive val : Type :=
| Int : nat -> val
| Pointer : ptr -> val
.

(** We will model heaps as lists of pointers and values. *)
Definition heap_t := list (ptr * list val).

Inductive valexp :=
| IntExp : nat -> valexp       (* n *)
| Deref : var -> nat -> valexp (* v[n] *)
.

Inductive com :=
| New : var -> list valexp -> com         (* var = malloc(length l) ; var[:] = l *)
| AssignMem : var -> nat -> valexp -> com (* var[i] = val *)
| AssignVar : var -> valexp -> com        (* assert(type(val) = Ptr) : var = val *)
| Drop : var -> com                       (* del var *)
| Out : valexp -> com                     (* assert(type(val) = Int) ; print(val) *)
.

(** roots is the top level var to pointers, output is ouput of the program *)
Definition roots_t := list (var * ptr).

Fixpoint roots_get (v:var) (r:roots_t) : option ptr :=
match r with
| List.nil => None
| (hv, hp)::t => if var_eq_dec hv v then Some hp else (roots_get v t)
end.
Definition roots_set (r: roots_t) (v: var) (p:ptr) : roots_t := (v,p)::r.
Definition roots_unset (r: roots_t) (v: var) : roots_t :=
  match roots_get v r with
  | Some p => List.remove var_ptr_eq_dec (v,p) r
  | None => r
  end.

Definition roots_maps (r: roots_t) (v: var) (p: ptr) : Prop :=
  List.In (v,p) r.

Lemma roots_maps_get :
  forall r v p,
    roots_maps r v p ->
    roots_get v r = Some p.
Proof.
Admitted.

Lemma roots_get_maps :
  forall r v p,
    roots_get v r = Some p ->
    roots_maps r v p.
Proof.
Admitted.

Lemma roots_maps_uniq :
  forall r v p p',
    roots_maps r v p ->
    roots_maps r v p' ->
    p = p'.
Proof.
Admitted.

Lemma roots_unset_1 :
  forall r v p,
    roots_maps (roots_unset r v) v p ->
    False.
Proof.
Admitted.

Lemma roots_unset_2 :
  forall r v v' p,
    v' <> v ->
    roots_maps r v p ->
    roots_maps (roots_unset r v') v p.
Proof.
Admitted.

Lemma roots_unset_3 :
  forall r v v' p,
    v' <> v ->
    roots_maps (roots_unset r v') v p ->
    roots_maps r v p.
Proof.
Admitted.

Lemma roots_set_1 :
  forall r v p p1,
    roots_maps (roots_set r v p) v p1 ->
    p = p1.
Proof.
Admitted.

Lemma roots_set_2 :
  forall r v p,
    roots_maps (roots_set r v p) v p.
Proof.
Admitted.

Lemma roots_set_3 :
  forall r v v1 p p1,
    v <> v1 ->
    roots_maps (roots_set r v p) v1 p1 ->
    roots_maps r v1 p1.
Proof.
Admitted.

Lemma roots_set_4 :
  forall r v v1 p p1,
    v <> v1 ->
    roots_maps r v1 p1 ->
    roots_maps (roots_set r v p) v1 p1.
Proof.
Admitted.

Definition output_t := list nat.

Fixpoint heap_get_struct (p:ptr) (h:heap_t) : option (list val) :=
match h with
| List.nil => None
| (hp, hv)::t =>
  if ptr_eq_dec hp p then
    Some hv
  else
    (heap_get_struct p t)
end.

(** val evaluation and helpers *)
Definition heap_get (p:ptr) (k: nat) (h:heap_t) : option val :=
match heap_get_struct p h with
| None => None
| Some hv => List.nth_error hv k
end.

Definition heap_maps (h: heap_t) (p: ptr) (k: nat) (v: val) : Prop :=
  heap_get p k h = Some v
.

Definition heap_maps_struct (h: heap_t) (p: ptr) (vs: list val) : Prop :=
  heap_get_struct p h = Some vs
.

Fixpoint set_nth {A: Type} (n: nat) (v: A) (l: list A) : option (list A) :=
  match n, l with
  | 0, h::t => Some (v::t)
  | S(n'), h::t =>
    match set_nth n' v t with
    | Some l' => Some (h::l')
    | None => None
    end
  | _, _ => None
  end.

Fixpoint heap_set_k (h: heap_t) (p: ptr) (k: nat) (v: val) : option heap_t :=
match h with
| List.nil => None
| (hp, hv)::t =>
  if ptr_eq_dec hp p then
    match set_nth k v hv with
    | Some hv' => Some ((hp,hv')::t)
    | None => None
    end
  else
    match heap_set_k t p k v with
    | Some h' => Some ((hp,hv)::h')
    | None => None
    end
end
.

Ltac funfold name :=
  unfold name in * ; fold name in *.

Lemma heap_sets_implies_exists_heap_maps_struct :
  forall h h' p k v,
    heap_set_k h p k v = Some h' ->
    exists vs, heap_maps_struct h p vs.
Proof.
  induction h. crush.
  intros.
  funfold heap_set_k.
  destruct a.
  funfold heap_maps_struct.
  funfold heap_get_struct.
  destruct (ptr_eq_dec p0 p).
  * eauto.
  * destruct (heap_set_k h p k v) eqn:?.
    - crush.
      specialize (IHh h0 p k v).
      intuition.
    - discriminate.
Qed.

Lemma heap_set_fails_implies_no_exists_heap_maps_struct :
  forall h p k v,
    heap_set_k h p k v = None ->
    ~exists vs, heap_maps_struct h p vs.
Proof.
  induction h ; unfold not ; intros.
  * funfold heap_maps_struct.
    funfold heap_get_struct.
    destruct H0.
    discriminate.
  * funfold heap_set_k.
    destruct a.
    destruct (ptr_eq_dec p0 p) eqn:?.
    - destruct (set_nth k v l) eqn:?.
      discriminate.
      destruct H0.
Admitted.

Lemma heap_sets_implies_heap_maps_1 :
  forall h h' p k v,
    heap_set_k h p k v = Some h' ->
    heap_maps h' p k v.
Proof.
Admitted.

Lemma heap_sets_implies_heap_maps_2 :
  forall h h' p p' k k' v v',
    heap_set_k h p k v = Some h' ->
    (p <> p' \/ k <> k') ->
    heap_maps h  p' k' v' ->
    heap_maps h' p' k' v'.
Proof.
Admitted.

Lemma heap_sets_implies_heap_maps_3 :
  forall h h' p p' k k' v v',
    heap_set_k h p k v = Some h' ->
    (p <> p' \/ k <> k') ->
    heap_maps h' p' k' v' ->
    heap_maps h  p' k' v'.
Proof.
Admitted.

Lemma set_nth_sets : forall {A: Type} k v (l l0: list A),
  set_nth k v l = Some l0 ->
  List.nth_error l0 k = Some v.
Proof.
  induction k; intros.
  * simpl in *.
    destruct l; crush.
  * simpl in *.
    destruct l.
    - crush.
    - destruct (set_nth k v l) eqn:?.
      + crush; eauto.
      + discriminate.
Qed.

(* Must be proven for liveness *)
Theorem heap_maps_struct_indexable : forall p h vs,
  heap_maps_struct h p vs ->
  forall a, List.In a vs ->
  exists k, heap_maps h p k a
.
Proof.
  Hint Resolve In_nth_error.
  Hint Unfold heap_maps heap_get.
  intros.
  unfold heap_maps.
  unfold heap_get.
  destruct p; crush.
Qed.

Theorem heap_get_implies_heap_maps : forall p h vs k v,
  heap_get_struct p h = Some vs ->
  nth_error vs k = Some v ->
  heap_maps h p k v
.
Proof.
  intros.
  unfold heap_maps.
  unfold heap_get.
  crush.
Qed.

Lemma heap_maps_implies_heap_get :
  forall h p n v,
  heap_maps h p n v ->
  exists vs,
    heap_get_struct p h = Some vs
    /\
    List.nth_error vs n = Some v
.
Proof.
  induction h ; intros.
  * inversion H.
  * specialize IHh with p n v.
    destruct a.
    unfold heap_get_struct.
    unfold heap_maps in *.
    unfold heap_get in *.
    destruct (ptr_eq_dec p0 p) eqn:?.
    - exists l. crush.
      destruct (ptr_eq_dec p p); crush.
    - crush.
      destruct (ptr_eq_dec p0 p); crush.
Qed.

Lemma heap_maps_struct_cons :
  forall h p p1 l vs,
    heap_maps_struct ((p1, l) :: h) p vs ->
    p <> p1 ->
    heap_maps_struct h p vs
.
Proof.
  intros.
  unfold heap_maps_struct in H.
  unfold heap_get_struct in H.
  fold heap_get_struct in H.
  destruct (ptr_eq_dec p1 p); crush.
Qed.

Lemma heap_get_in :
  forall p v h,
    heap_get_struct p h = Some v ->
    List.In p (fst (split h)).
Proof.
  induction h. crush.
  destruct a.
  unfold heap_get_struct in * ; fold heap_get_struct in *.
  edestruct ptr_eq_dec.
  + intros. subst.
    eapply in_split_l_ht. apply ptr_eq_dec. right. reflexivity.
  + intuition.
    eapply in_split_l_ht. apply ptr_eq_dec. left. auto.
Qed.

Record state := mkState {
                    roots : roots_t;
                    heap : heap_t;
                    output: output_t;
                  }.

Fixpoint max_heap_idx (h: heap_t) : ptr :=
  match h with
  | List.nil => 0
  | (p,_)::t =>
    if le_gt_dec p (max_heap_idx t) then
      (max_heap_idx t)
    else
      p
  end.

Fixpoint max_struct_val (l: list val) : ptr :=
  match l with
  | List.nil => 0
  | (Int _) :: t => max_struct_val t
  | (Pointer p) :: t =>
    if le_gt_dec p (max_struct_val t) then
      (max_struct_val t)
    else
      p
  end.


Fixpoint max_heap_val (h: heap_t) : ptr :=
  match h with
  | List.nil => 0
  | (_,v)::t =>
    if le_gt_dec (max_struct_val v) (max_heap_val t) then
      (max_heap_val t)
    else
      (max_struct_val v)
  end.

Definition max_heap (h: heap_t) : ptr :=
  if le_gt_dec (max_heap_idx h) (max_heap_val h) then
    (max_heap_val h)
  else
    (max_heap_idx h)
.

Fixpoint max_root (r: roots_t) : ptr :=
  match r with
  | List.nil => 0
  | (_,p)::t =>
    if le_gt_dec p (max_root t) then
      (max_root t)
    else
      p
  end.

Definition max_state (s: state) :=
  if le_gt_dec (max_heap (heap s)) (max_root (roots s)) then
    (max_root (roots s))
  else
    (max_heap (heap s))
.

Definition fresh_ptr (s: state) : ptr :=
  S (max_state s).


Definition eval_valexp (r: roots_t) (h: heap_t) (v: valexp) : option val :=
  match v with
  | IntExp i => Some (Int i)
  | Deref var idx =>
    match roots_get var r with
    | Some p => heap_get p idx h
    | None => None
    end
  end.

Definition update_heap (r: roots_t) (h: heap_t) (lhv: var) (lhidx: nat) (rhv: val) : option heap_t :=
  match roots_get lhv r with
  | None => None
  | Some lhp =>
    match heap_set_k h lhp lhidx rhv with
    | Some h' => Some h'
    | None => None
    end
  end.

Notation "x <-- A ; B" := (match A with | Some x => B | None => None end)
                            (right associativity, at level 84).

Fixpoint option_eval (r: roots_t) (h: heap_t) (vals: list valexp) :=
  match vals with
  | List.nil => Some List.nil
  | vexp::t =>
    match eval_valexp r h vexp, option_eval r h t with
    | Some v, Some rest =>
      Some (List.cons v rest)
    | _, _ => None
    end
  end.

Definition handle_small_step (s: state) (c: com) : option state :=
  let r := roots s in
  let h := heap s in
  let o := output s in
  match c with
  | New var vals =>
    let p := fresh_ptr s in
    let r' := roots_set r var p in
    match option_eval r h vals with
    | Some vals =>
      let h' := (p, vals)::h in
      Some (mkState r' h' o)
    | None =>
      None
    end
  | AssignMem lhvar lhidx rhv =>
    rhv <-- eval_valexp r h rhv ;
      h' <-- update_heap r h lhvar lhidx rhv ;
      Some (mkState r h' o)
  | AssignVar var val =>
    match eval_valexp r h val with
    | Some (Pointer p) =>
      let r' := roots_set r var p in
      Some (mkState r' h o)
    | _ => None
    end
  | Drop var =>
    let r' := roots_unset r var in
    Some (mkState r' h o)
  | Out val =>
    match eval_valexp r h val with
    | Some (Int i) => Some (mkState r h (i::o))
    | _ => None
    end
  end.
