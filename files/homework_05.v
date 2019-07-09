Require Import Coq.Arith.Max.

(*

Fixpoint max n m {struct n} : nat :=
  match n, m with
    | O, _ => m
    | S n', O => n
    | S n', S m' => S (max n' m')
  end.

*) 

(*

Definicje arytmetyczne sa w Coq.Init.Max, ktore laduja sie na poczatku -- tu tylko do wgladu jak dzialaja

Fixpoint plus (n m:nat) {struct n} : nat :=
  match n with
  | O => m
  | S p => S (p + m)
  end

*)

Inductive btree (T : Set) : Set :=
| Leaf : btree T
| Node : btree T -> T -> btree T -> btree T.

Fixpoint height T (t : btree T) : nat :=
  match t with
    | Leaf => O
    | Node t1 _  t2 => max (height T t1) (height T t2)
  end.

Fixpoint graft T (t1 t2 : btree T) : btree T :=
  match t1 with
    | Leaf => t2
    | Node t1' x t2' => Node T (graft T t1' t2) x (graft T t2' t2)
  end.

Lemma max_plus : forall (n x y: nat), max (x + n) (y + n) = (max x y) + n.
induction n.
intros.
rewrite <- plus_n_O.
rewrite <- plus_n_O.
rewrite <- plus_n_O.
reflexivity.
intros.
replace ((max x y) + (S n)) with (S ((max x y) + n)).
rewrite <- (IHn x y).
replace (x + (S n)) with (S (x + n)).
replace (y + (S n)) with (S (y + n)).
apply max_SS.
apply plus_n_Sm.
apply plus_n_Sm.
apply plus_n_Sm.
Qed.

Theorem graft_height : forall T (t1 t2 : btree T), 
  height T (graft T t1 t2) = (height T t1) + (height T t2).

(* Zadanie domowe, do zrobienia w 7 linijkach *)
intros;induction t1.
unfold graft;simpl.
reflexivity.
simpl.
rewrite IHt1_1.
rewrite IHt1_2.
apply max_plus.
Qed.

