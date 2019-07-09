Require Export Maps MapNotations MapInterface MapFacts.

(* Constructing the empty map *)

Definition M' : Map[nat, nat] := [].
(* Equiv: Definition M' : Map[nat, nat] := empty nat. *)

(* Constructing a map with values *)

Definition N' := (M' [ 0 <- 5 ]) [1 <- 6].

(* Intuition: map [ key <- value ] *)
(* Equiv: Definition n' := add 1 6 (add 0 5 m'). *)


(*** Properties of maps *)

(** Emptiness *)
(* Remark: 'empty' is the empty map, 'is_empty' is a function bool -> dict *)
(* Remark: 'dict' is a constructor for maps *)

Example empty_is_empty'' :
  is_empty M' = true.
Proof. reflexivity. Qed.

Example empty_is_empty_with_prop :
  Empty M'.
Proof. intuition. Qed.

Example not_empty_is_not_empty' :
  is_empty N' = false.
Proof. reflexivity. Qed.


(** Cardinality: How many keys does the map have? *)

Example empty_has_zero' :
  cardinal M' = 0.
Proof. reflexivity. Qed.

Example non_zero' :
  cardinal N' = 2.
Proof. reflexivity. Qed.
	

(** Membership: is key X in this map? *)

Example is_member' :
  mem 1 N' = true. (* Key 1 is in N' *)
Proof. reflexivity. Qed.

Example is_member_with_prop :
  In 1 N'. (* Key 1 is in N' *)
Proof. intuition. Qed.

Example is_not_member' :
  mem 4 M' = false.
Proof. reflexivity. Qed.


(** Find: Give me the value at key X *)

(* Finding a value using convenient notation *)
(* Remark: value is 'option (element_type)' *)
Example get_value_with_notation' :
  N'[ 0 ] = Some 5.
Proof. reflexivity. Qed.

(* Finding the same value with an explicit function call *)

Example get_value_no_notation' :
  find 0 N' = Some 5.
Proof. reflexivity. Qed.

Example not_found' :
  N'[ 2 ] = None.
Proof. reflexivity. Qed.

(**
  Note that if we state something false, such as:
    M' [ 3 ] = Some 1.
  coq does not complain or fail. It simply leaves us with
  the obligation of proving false.
  Remember that M' is the empty map.
*)
  

(** Remove: Give me a map without key X *)

(* Copied from exercises *)
Fixpoint beq_nat (n m : nat) : bool :=
  match n with
  | O => match m with
         | O => true
         | S m' => false
         end
  | S n' => match m with
            | O => false
            | S m' => beq_nat n' m'
            end
  end.

(* Two maps con be considered equal if all their keys are equal *)
(* However, this may not be the best defintion *)
Example remove_element :
  equal beq_nat (remove 1 (add 1 5 [])) [] = true.
Proof. reflexivity. Qed.

Example remove_element_with_prop :
  Equivb beq_nat (remove 1 (add 1 5 [])) [].
Proof. rewrite equal_iff. reflexivity. Qed.

Example remove_empty :
  Equivb beq_nat (remove 1 []) [].
Proof. rewrite equal_iff. reflexivity. Qed.
  


(** Mapping over elements *)

(* Add 1 to each element *)

Example map_plus' :
  equal beq_nat (map (plus 1) (add 2 6 (add 1 5 []))) (add 2 7 (add 1 6 [])) = true.
Proof. reflexivity. Qed.


(** Folding over elements *)

(* We only need the key as input here because 'fold' expects it *)
Definition mult' (key elem acc : nat) := elem * acc.

Example fold_mult' :
  fold mult' (add 2 6 (add 1 5 [])) 1 = 30.
Proof.  reflexivity. Qed.
