Require Export Maps MapNotations MapInterface MapFacts.

(* HEAP *)
Definition Heap := Map [ nat, nat ].

Fixpoint alloc (addr cells : nat) (heap : Heap) : Heap :=
  match cells with
  | 0 => heap
  | S c => add addr 0 (alloc (addr+1) c heap)
  end.

Definition dealloc (addr : nat) (heap : Heap) : Heap :=
  remove addr heap.
   
Definition read (addr : nat) (heap : Heap) : nat :=
  match find addr heap with
  | Some n => n
  | None => 0
  end.
 
Definition write (addr value : nat) (heap : Heap) : Heap :=
  match find addr heap with
  | Some _ => add addr value (remove addr heap)
  | None   => heap
  end.

(* Allocation *)
(**
Theorem allocation_cardinality : forall heap key,
  ~ In key heap -> S (cardinal heap) = cardinal (alloc [key] heap).
Proof.
  intros.
  symmetry.
  rewrite cardinal_2 with (m:=heap) (x:=key) (e:=Free).
  reflexivity.
  assumption.
  
  unfold Add.
  reflexivity.
Qed.
*)
(**
Theorem allocate_none : forall heap key,
  (alloc key heap) [ key ] = Some Free.
Proof.
  unfold alloc.
  intuition.
Qed.
*)
(* Deallocation *)

Theorem deallocation_cardinality : forall heap key,
  In key heap -> cardinal heap = S (cardinal (dealloc key heap)).
Proof. Admitted.

Theorem deallocate_key : forall heap key,
  (dealloc key heap) [ key ] = None.
Proof.
  intros.
  unfold dealloc.
  rewrite remove_eq_o.
  reflexivity.
  reflexivity.
Qed.
  
Theorem deallocate_empty_heap : forall heap key,
  Empty heap -> Empty (dealloc key heap).
Proof.
Admitted.

(* Write *)

(** Theorem write_sound : forall heap heap' key value,
  In key heap -> write key value heap = heap'. *)

(* Read *)
(**
Theorem read_sound : forall heap key value,
  In key heap -> read key (write key value heap) = Some (Holds value).
Proof.
  intros.
  unfold read.
  inversion H.
  rewrite find_mapsto_iff in H0.
  unfold write.
  rewrite H0.
  intuition.
Qed.
*)