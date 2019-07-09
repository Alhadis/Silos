(** * Various simple examples *)
Require Import String.
Require Import Polymorphic.Ast.
Require Import Polymorphic.EvalE.
Require Import List.
Import ListNotations.
From Template Require Ast AstUtils.
Require Import Template.Typing.
From Template Require Import TemplateMonad.
From Template Require Import monad_utils.

Module TC := Template.Ast.

Import MonadNotation.
Import BaseTypes.
Import StdLib.


(** ** Functions *)

(** An AST of the negation function *)
Definition my_negb_syn :=
  [| \x : Bool => case x : Bool return Bool of
                   | True -> False
                   | False -> True  |].

(** An AST of the negation function applied to [true] *)

Definition negb_app_true :=
    [| {my_negb_syn} True |].

(** Print the AST without notations  *)
Unset Printing Notations.
Print my_negb_syn.

Set Printing Notations.

Import InterpreterEnvList.

(** Execute the program using the interpreter (named and nameless representations) *)
Compute (expr_eval_n 3 Σ [] negb_app_true).
(* = Ok (vConstr "bool" "false" []) *)

Compute (expr_eval_i 3 Σ [] (indexify [] negb_app_true)).
(* = Ok (vConstr "bool" "false" []) *)


(** Make a Coq function from the AST of the program *)

Make Definition my_negb :=
  Eval compute in (expr_to_term Σ (indexify [] my_negb_syn)).

(** [my_negb] applied to true *)
Make Definition coq_negb_app_true :=
  Eval compute in (expr_to_term Σ (indexify nil negb_app_true)).

Print coq_negb_app_true.
(* coq_negb_app_true = (fun x : bool => if x then false else true) true *)

(** Compute with the shallow embedding *)
Compute coq_negb_app_true.
(*  = false *)

(** Our shallow embedding of the negation function corresponds to the [negb] function from the standard library of Coq *)
Lemma my_negb_coq_negb b :
  my_negb b = negb b.
Proof. reflexivity. Qed.

(** More examples of functions *)

Definition is_zero_syn :=
  [|

      \x : Nat =>
           case x : Nat return Bool of
           | Z -> True
           | Suc y -> False

  |].

Make Definition is_zero' := Eval compute in (expr_to_term Σ (indexify nil is_zero_syn)).

Definition pred_syn :=
  [|

      \x : Nat =>
           case x : Nat return Nat of
           | Z -> x
           | Suc y -> y

  |].

Make Definition pred' := Eval compute in (expr_to_term Σ (indexify nil pred_syn)).

(** ** Examples of fixpoints *)

Definition factorial_syn :=
  [|
   fix "factorial" (x : Nat) : Nat :=
       case x : Nat return Nat of
       | Z -> 1
       | Suc y -> x * ("factorial" y)
  |].

Make Definition factorial :=
  Eval compute in ((expr_to_term Σ (indexify [] factorial_syn))).

Definition plus_syn : expr :=
  [| fix "plus" (x : Nat) : Nat -> Nat :=
           case x : Nat return Nat -> Nat of
           | Z -> \y : Nat => y
           | Suc y -> \z : Nat => Suc ("plus" y z) |].

Make Definition my_plus := Eval compute in (expr_to_term Σ (indexify [] plus_syn)).

(** The shallow embedding of our implementation of addition corresponds to the addition of natural numbers the standard library of Coq *)
Lemma my_plus_correct n m :
  my_plus n m = n + m.
Proof. induction n;simpl;auto. Qed.


Definition two :=
  (vConstr Nat "Suc"
           [vConstr Nat "Suc" [vConstr Nat "Z" []]]).

Definition one_plus_one :=
  [| {plus_syn} 1 1 |].

Compute (expr_eval_n 10 Σ [] [| {plus_syn} 1 1 |]).
(* = Ok (vConstr "nat" "Suc" [vConstr "nat" "Suc" [vConstr "nat" "Z" []]])*)


(** Computing with the deep embedding *)
Example one_plus_one_two : expr_eval_n 10 Σ [] one_plus_one = Ok two.
Proof. reflexivity. Qed.


(** An alternative way of defining addition *)
Definition plus_syn' :=
  [| \x : Nat =>
          (fix "plus" (y : Nat) : Nat :=
           case y : Nat return Nat of
           | Z -> x
           | Suc z -> Suc ("plus" z))
  |].

Make Definition my_plus' :=
  Eval compute in ((expr_to_term Σ (indexify [] plus_syn'))).

Lemma my_plus'_0 : forall n, my_plus' 0 n = n.
Proof.
  induction n;simpl;easy.
Qed.

Lemma my_plus'_Sn : forall n m, my_plus' (S n) m = S (my_plus' n m).
Proof.
  induction m;simpl;easy.
Qed.

Lemma my_plus'_comm : forall n m, my_plus' n m = my_plus' m n.
Proof.
  induction n; intros m;simpl.
  + rewrite my_plus'_0. reflexivity.
  + rewrite my_plus'_Sn. easy.
Qed.

(** [my_plus'] corresponds to addition of natural numbers defined in the standard library *)
Lemma my_plus'_correct : forall n m, my_plus' n m = n + m.
Proof.
  intros n m.
  induction m;simpl;easy.
Qed.


(** The two interpreters (for the named and nameless representations) give the same results on the test case *)
Example plus_named_and_indexed :
  let two := [| (Suc 1)|] in
  let three := [| Suc {two} |] in
  expr_eval_n 20 Σ [] [| ({plus_syn} {two}) {three} |] =
  expr_eval_i 20 Σ [] (indexify [] [| ({plus_syn} {two}) {three} |]).
Proof. reflexivity. Qed.

(** ** Translating inductives *)


(** The type of natural numbers *)
Definition Nat_syn :=
  [\ data "Nat" := "Z" : "Nat" | "Suc" : "Nat" -> "Nat" ; \].

Make Inductive (trans_global_dec Nat_syn).

Print Nat.
(* Inductive Nat : Set :=  Z : Nat | Suc : Nat -> Nat *)


(** Records *)

Import Template.Ast.

Definition State_syn :=
  [\ record "State" := { "balance" : "Nat" ; "day" : "Nat" }  \].

Make Inductive (trans_global_dec State_syn).

Print State.
(* Record State : Set := mkState { balance : Nat;  day : Nat } *)

Print balance.
(* balance = fun State : State => balance State : State -> Nat *)

Print day.
(* day = fun State : State => day State : State -> Nat *)
