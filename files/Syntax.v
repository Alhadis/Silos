Section Syntax.

Require Export Coq.Lists.List.
Require Import Coq.Arith.EqNat.
Require Import Coq.Arith.Peano_dec.
Require Import Coq.Bool.Bool.

(************************************************************************************)
(*                  Define Variables, Functions and Relations.                      *)  
(************************************************************************************)
Inductive var : Set :=
  Var : nat -> var.

Inductive fn : Set :=
  Fn : nat -> fn.

Inductive rel : Set :=
  Rel : nat -> rel.

Definition var_dec : forall (a b  : var), {a = b} + {a <> b}.
intros.
decide equality. apply Peano_dec.eq_nat_dec.
Defined.

Definition fn_eq : forall (a b : fn), {a = b} + {a <> b}.
intros.
decide equality. apply Peano_dec.eq_nat_dec.
Defined.

Definition rel_eq : forall (a b : rel), {a = b} + {a <> b}.
intros.
decide equality. apply Peano_dec.eq_nat_dec.
Defined.
(************************************************************************************)
(*             Define the syntax of FOCALE as co-inductive sets.                       *)
(************************************************************************************)

Inductive term : Set :=
  Var_t : var -> term
| Fun_t : fn -> list term -> term.

Inductive formula : Set :=
  FocalTrue : formula
| FocalFalse : formula
| Rel_f : rel -> list term -> formula
| Eq : term -> term -> formula
| And : formula -> formula -> formula
| Or : formula -> formula -> formula
| Implies : formula -> formula -> formula
| Not : formula -> formula
| Forall : var -> formula -> formula
| Exists : var -> formula -> formula
| Says : term -> formula -> formula
| Speaksfor : term -> term -> formula.

Scheme formula_mut := Induction for formula Sort Prop.
Scheme term_mut := Induction for term Sort Prop.

(************************************************************************************)
(*                Define free variables in FOCALE formulas and terms.                  *)
(************************************************************************************)

Fixpoint notfree_in_term (x : var) (tau : term) {struct tau} : bool :=
match tau with 
| Var_t (Var m) =>     
    match x with 
    | Var(n) => if (beq_nat m n) then true else false
    end
| Fun_t f taus => existsb (notfree_in_term x) taus
end.

Fixpoint notfree_in_formula (x : var) (phi : formula) {struct phi} : bool :=
match phi with 
| FocalTrue => false
| FocalFalse => false
| Rel_f r taus => forallb (notfree_in_term x) taus
| Eq tau1 tau2 => andb (notfree_in_term x tau1) (notfree_in_term x tau2)
| And phi psi => andb (notfree_in_formula x phi) (notfree_in_formula x psi)
| Or phi psi => andb (notfree_in_formula x phi) (notfree_in_formula x psi)
| Implies phi psi => andb (notfree_in_formula x phi) (notfree_in_formula x psi)
| Not phi => notfree_in_formula x phi
| Forall (Var m) phi => 
    match x with 
    | Var(n) => if (beq_nat m n) then true else (notfree_in_formula x phi)
    end
| Exists (Var m) phi => 
    match x with 
    | Var(n) => if (beq_nat m n) then true else (notfree_in_formula x phi)
    end
| Says tau phi => notfree_in_formula x phi
| Speaksfor tau1 tau2 => (notfree_in_term x tau1) && (notfree_in_term x tau2)
end.

(************************************************************************************)
(*     Helper function, decides if a variable is free in any formula in a list.     *)
(************************************************************************************)

Definition notfree (x : var) (Gamma : list formula) : bool:=
  forallb (notfree_in_formula x) Gamma.

(************************************************************************************)
(* Define a procedure for substituting a term for a variable in formulas and terms. *)
(************************************************************************************)
Fixpoint subst_term (x : var) (tau : term) (tau' : term) {struct tau'} : term :=
match tau' with 
| Var_t (Var m) =>     
    match x with 
    | Var(n) => if (beq_nat m n) then tau else tau'
    end
| Fun_t f taus => Fun_t f (map (subst_term x tau') taus)
end.

Fixpoint subst (x : var) (tau : term) (phi : formula) {struct phi} : formula :=
match phi with
| FocalTrue => FocalTrue
| FocalFalse => FocalFalse
| Rel_f r taus => Rel_f r (map (subst_term x tau) taus)
| Eq tau1 tau2 => Eq (subst_term x tau tau1) (subst_term x tau tau2) 
| And phi psi => And (subst x tau phi) (subst x tau psi)
| Or phi psi => Or (subst x tau phi) (subst x tau psi)
| Implies phi psi => Implies (subst x tau phi) (subst x tau psi)
| Not phi => Not (subst x tau phi)
| Forall (Var m) phi => 
    match x with 
    | Var(n) => if (beq_nat m n) then phi else (Forall (Var m) (subst x tau phi))
    end
| Exists (Var m) phi => 
    match x with 
    | Var(n) => if (beq_nat m n) then phi else (Exists (Var m) (subst x tau phi))
    end
| Says tau' phi => Says (subst_term x tau tau') (subst x tau phi)
| Speaksfor tau1 tau2 => Speaksfor (subst_term x tau tau1) (subst_term x tau tau2)
end.


End Syntax.
