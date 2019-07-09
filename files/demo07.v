
(* Prop is *p and Set is *s. Type is the box in Lambda C *)
Check Prop.
Check Set.

(* nat is the set of the natural numbers *)
Check nat.

Check 3.

Check plus.

Check (nat->(nat->nat)).

Check (plus 3).

Check (3 + 3).

(*
 Coq Notation:
   Lambda abstraction: fun x:A => M,
   Pi abstraction:     forall x:A, B   
*)

Check fun n:nat => (plus n (S O)).

Check fun n => n + 1.

Check fun P:nat -> Prop => forall x:nat, P x -> P x.

(* implicit type assignments: *)

Check (fun x => x + x).

Check (fun x => x=3).

(* product types: the polymorphic identity *)

Check (fun (A:Set)(x:A) => x).

(* Searching known results:*)

Check lt.

SearchAbout lt.

(* Useful first step: load collections of known facts and functions. *)

Require Import Arith. 

SearchAbout lt.

(* Warning: "SearchAbout <." does not work.  *)

SearchPattern (lt _ _).

SearchPattern (_ < _).

Check lt_S.

Print lt_S.

Check (lt_S 3).

Check (lt_S 3 1).

(* Declaration *)
Variable n: nat.

Hypothesis Pos_n: n>0.

(* Definition *)

Definition double:= fun x => x + x.

Check double.

Print double.

(* Propositional logic: Prove A -> B -> A  *)

Goal forall A B:Prop, A -> B -> A.
Proof.
  intros A B H0 H1.
  assumption.
Save ABA.

Print ABA.

(* Second-order definition of conjunction *)

Lemma Stupid: forall (A B:Prop), A -> B.
Proof.
Admitted.

Definition two := S (S 0).

Check two.

Lemma TwoIsTwo: two = S (S 0).
Proof.
  unfold two.
  reflexivity.
(* or, more generally: trivial. *)
Qed.

Lemma Example1: forall A B C:Prop, (A->B) -> (B->C) -> (A->C).
Proof.
  intros A B C.
  intro.
  intro.
  intro.
  apply H0.
  apply H.
  assumption.Qed.

Lemma Example2: 
  forall A: Set,
  forall P: A -> Prop,
  forall Q: A -> Prop,
  forall c: forall x:A, P x -> Q x,
  forall d: forall x:A, P x,
  forall z:A, Q z.
Proof.
  intros.
  apply c.
  apply d.
Qed.

Print Example2.

Print and.

(* /\ is the infix notation for the predefined "and" *)
(* note the implicit `forall': *)

Lemma Example3 (A B:Prop): (A /\ B) -> A.
Proof.
  intros.
  elim H.
  apply ABA.
Qed.

Section InductiveDefinition.

Inductive List: Set:=
| nil: List
| cons: nat -> List -> List.

Fixpoint appendDifficult (L: List) : List -> List :=
fun M: List =>
match L with
| nil => M
| cons n L' => cons n (appendDifficult L' M)
end.

(* This is an easier way of writing appendDifficult *)

Fixpoint append (L M: List) {struct L} : List :=
match L with
| nil => M
| cons n L' => cons n (append L' M)
end.

Lemma App_Nil: forall L, append L nil = L.
Proof.
  induction L.
  simpl.
  trivial.
  simpl.
  rewrite IHL.
  trivial.
Qed.

Lemma App_Assoc: forall (L1 L2 L3:List), 
  append L1 (append L2 L3) = append (append L1 L2) L3.
Proof.
  induction L1.
  trivial.

  intros.
  simpl.
  rewrite IHL1.
  trivial.
Qed.

End InductiveDefinition.

Section CaseDistinctions.

(* Definitions using case distinctions *)

Check eq_nat_dec.

Definition CaseDist1: nat -> nat := 
fun n =>
( if (eq_nat_dec n two) then 0 else 1).

(* Another way of doing the same: *)

Definition CaseDist2 (n: nat) : nat :=
match (eq_nat_dec n two) with
| left _ => 0
| right _ => 1
end.

Lemma Test: CaseDist2 1 = 1.
Proof.
  unfold CaseDist2.
  simpl.
  reflexivity.
Qed.

(* More complicated case distinction: *)

Check lt_eq_lt_dec.

(* this is a nested construction:

inleft _ : {n<m} + {n=m}
inleft (left _ ) : {n<m}
inleft (right _) : {n=m}
inright _ : {m<n}

This should clarify what the following definition does: *)

Definition CaseDist3 (n: nat) : nat :=
match (lt_eq_lt_dec n 3) with
| inleft (left _) => 1
| inleft (right _) => 3
| inright _ => 5
end.

(* If we now Print the definition, we see an alternative way 
of doing the same, using "if-then": *)

Print CaseDist3.

End CaseDistinctions.