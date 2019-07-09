

Require Import ILogic ILTac ILInsts.
Require Import BILogic BILTac SepAlgMap.
Require Import MapInterface MapFacts.

Inductive id : Type := 
  Id : nat -> id.

Definition state := id -> nat.
Definition heap := Map [nat, nat].

(* To create an intuitionistic logic, we must first open up these already existing type class instances.
   These are no generally available as Coq's type class inference engine can take a very long time if too
   many facts are available. Therefor we open it up just for the purpose of creating an intuitionistic logic
   for Assertion. *)

Local Existing Instance ILFun_Ops.
Local Existing Instance ILFun_ILogic.
Local Existing Instance ILPre_Ops.
Local Existing Instance SABIOps.
Local Existing Instance SABILogic.

Definition Assertion := ILPreFrm (@Equiv.equiv heap _) (state -> Prop).

(* Assertions are an intuitionistic logic *)

Instance AssertionILogic : BILogic Assertion := _.

(* And that's all you have to do :) *)


(*
The predicates available are the following

ltrue (true)
lfalse (false)
//\\ ( and )
\\// ( or )
-->> ( implication )
Forall x, P x (forall)
Exists x, P x (exists) 
/\\ ( and, but with a propositional predicate on the left)
->> ( implication, but with a propositional predicate on the left)

For a complete range of the tactics available to you, look in ILogic.v

*)

Example test (p q r : Assertion) :
  p //\\ q //\\ r |-- q //\\ r //\\ p.
Proof.
  repeat apply landR.
  + apply landL2. apply landL1. reflexivity.
  + apply landL2. apply landL2. reflexivity.
  + apply landL1. reflexivity.
Qed.

Example test_exists_right (p : nat -> Assertion) (q : Assertion) :
  p 5 //\\ q |-- (Exists n, p n) //\\ q. (* Note that the existential is not the outermost operator *)
Proof.
  lexistsR 5. (* This tactic works for up to three existentials, e.g. lexistsR 5 6 7 *)
  reflexivity.
Qed.

Example test_exists_left (p : nat -> Assertion) (q : Assertion) :
  (q //\\ Exists x, x = 5 /\\ p x) |-- (Exists n, n = 5 /\\ p n) //\\ q. 
Proof. (* Note that this goal can be proved in an easier way, but this demonstrates the tactics. *)
  lexistsL n.
  lpropandL H. (* Propositions can be pulled out of conjunctions on the left *)
  lexistsR n.
  apply landR.
  lpropandR.
  apply landL2. reflexivity.
  assumption.
  apply landL1. reflexivity.
Qed.

(* The tactics available are: 

lexistsL ( pulls existentials on the left to the context )
lexistsR ( given a witness, instantiates an existential on the right )

lforallL ( given a witness, instantiates a universal on the left )
lforallR ( pulls universals on the right to the context )

lpropimplL ( applies a modus ponens rule to a propositional implication on the left.
             That proposition will be left as a separate goal for the user to prove)

lpropandL ( pulls a conjunctioned propositional predicate on the left to the context )
lpropandR ( Removes a conjunction propositional predicate on the right and leaves it
            as a seperate goal for the user to prove )

There is also a lemma lpropandR that pulls an implied propositional predicate on the right
to the context, but this requires that the implication is the outermost operator (i.e. P ->> q)

Next week, separation logic.

*)

(* Exposing the state 

Note that we cannot expose the state directly
*)

Example test_expose_fail (p : Assertion) : p |-- p.
try intro st. (* Fails, because the operators are opaque *)
reflexivity.
Qed.

Local Transparent ILFun_Ops.
Local Transparent ILPre_Ops.
Local Transparent SABIOps.

Example test_expose (p q : Assertion) : p //\\ q |-- q //\\  p.
Proof.
  intros _ h s.
  simpl.
  firstorder.
Qed.

(* The Local Transparent means that the operators are only transparent for this file. This is important.
   You do NOT want the operators to be transparent in general. However, when proving 
   meta theoretical properties about your triples it will be required.

   We can also set them to be Opaque again.

*)

Global Opaque ILFun_Ops.



