(** (This following part of this file is copied from <<Software Foundation>>
volume 1. It should be only used for lecture notes and homework assignments for
course CS263 of Shanghai Jiao Tong University, 2019 spring. Any other usage are
not allowed. For the material of thses parts, please refer to the original
book.) *)

(** Acknowledgements: Some of the following part is the Imp Library for course
CS263. The author is Prof. Qinxiang Cao. *)

(** Introduction: This revised Imp Library is for the final project of CS263 --
the completeness of OneBinRel_FOL. *)

(** Last Revised 2019-6-23 22:34:42 By Mingjie Li, 2017 IEEE Honor Class, SJTU *)

Require Import Coq.Relations.Relation_Operators.
Require Import Coq.Relations.Relation_Definitions.
Require Export Coq.ZArith.ZArith.
Require Export Coq.Strings.String.
Require Export Coq.Logic.Classical.
Require Import Coq.Lists.List.

Arguments clos_refl_trans {A} _ _ _.
Arguments clos_refl_trans_1n {A} _ _ _.
Arguments clos_refl_trans_n1 {A} _ _ _.

Open Scope Z.

(** -------------------- B E G I N --------------------- *)

Module OneBinRel_FOL.

Definition logical_var: Type := nat.

Inductive term: Type :=
| TId (v: logical_var): term.

Inductive prop: Type :=
| PEq (t1 t2: term): prop
| PRel (t1 t2: term): prop
| PFalse: prop
| PImpl (P Q: prop): prop
| PForall (x: logical_var) (P: prop): prop.

Definition PTrue: prop := PImpl PFalse PFalse.
Definition PNot (P: prop): prop := PImpl P PFalse.
Definition PAnd (P Q: prop): prop := PNot (PImpl P (PNot Q)). 
Definition POr (P Q: prop): prop := PImpl (PNot P) Q. 
Definition PExists (x: logical_var) (P: prop): prop :=
  PNot (PForall x (PNot P)).

Bind Scope FOL_scope with prop.
Delimit Scope FOL_scope with FOL.

Coercion TId: logical_var >-> term.
Notation "x == y" := (PEq x y) (at level 70, no associativity) : FOL_scope.
Notation "P1 'OR' P2" := (POr P1 P2) (at level 76, left associativity) : FOL_scope.
Notation "P1 'AND' P2" := (PAnd P1 P2) (at level 74, left associativity) : FOL_scope.
Notation "P1 'IMPLY' P2" := (PImpl P1 P2) (at level 77, right associativity) : FOL_scope.
Notation "'NOT' P" := (PNot P) (at level 73, right associativity) : FOL_scope.
Notation "'EXISTS' x ',' P " := (PExists x ((P)%FOL)) (at level 79,  right associativity) : FOL_scope.
Notation "'FORALL' x ',' P " := (PForall x ((P)%FOL)) (at level 79, right associativity) : FOL_scope.

Definition term_rename (x y: logical_var) (t: term) :=
    match t with
    | TId x' => 
        if Nat.eq_dec x x'
        then TId y
        else TId x'
    end.

Fixpoint prop_rename (x y: logical_var) (d: prop): prop :=
    match d with
    | PEq t1 t2    => PEq (term_rename x y t1) (term_rename x y t2)
    | PRel t1 t2   => PRel (term_rename x y t1) (term_rename x y t2)
    | PImpl P1 P2  => PImpl (prop_rename x y P1) (prop_rename x y P2)
    | PFalse       => PFalse
    | PForall x' P => if Nat.eq_dec x x'
                      then PForall x' P
                      else PForall x' (prop_rename x y P)
    end.

Definition term_max_var (t: term): logical_var :=
    match t with
    | TId x => x
    end.

Fixpoint prop_max_var (d: prop): logical_var :=
    match d with
    | PEq t1 t2    => max (term_max_var t1) (term_max_var t2)
    | PRel t1 t2   => max (term_max_var t1) (term_max_var t2)
    | PFalse       => O
    | PImpl P1 P2  => max (prop_max_var P1) (prop_max_var P2)
    | PForall x' P => max x' (prop_max_var P)
    end.

Definition new_var (P: prop) (t: term): logical_var :=
  S (max (prop_max_var P) (term_max_var t)).

Definition term_occur (x: logical_var) (t: term): nat :=
    match t with
    | TId x' => if Nat.eq_dec x x' then S O else O
    end.

Fixpoint prop_free_occur (x: logical_var) (d: prop): nat :=
    match d with
    | PEq t1 t2    => (term_occur x t1) + (term_occur x t2)
    | PRel t1 t2   => (term_occur x t1) + (term_occur x t2)
    | PFalse       => O
    | PImpl P1 P2  => (prop_free_occur x P1) + (prop_free_occur x P2)
    | PForall x' P => if Nat.eq_dec x x'
                      then O
                      else prop_free_occur x P
    end.

Fixpoint rename_all (t: term) (d: prop): prop :=
    match d with
    | PEq t1 t2   => PEq t1 t2
    | PRel t1 t2  => PRel t1 t2
    | PFalse      => PFalse
    | PImpl P1 P2 => PImpl (rename_all t P1) (rename_all t P2)
    | PForall x P => match term_occur x t with
                        | O => PForall x (rename_all t P)
                        | _ => PForall
                                 (new_var (rename_all t P) t)
                                 (prop_rename x
                                   (new_var (rename_all t P) t)
                                   (rename_all t P))
                        end
    end.

Definition term_sub (x: logical_var) (tx: term) (t: term) :=
    match t with
    | TId x' =>
         if Nat.eq_dec x x'
         then tx
         else TId x'
    end.

Fixpoint naive_sub (x: logical_var) (tx: term) (d: prop): prop :=
    match d with
    | PEq t1 t2   => PEq (term_sub x tx t1) (term_sub x tx t2)
    | PRel t1 t2  => PRel (term_sub x tx t1) (term_sub x tx t2)
    | PFalse      => PFalse
    | PImpl P1 P2 => PImpl (naive_sub x tx P1) (naive_sub x tx P2)
    | PForall x P => PForall x (naive_sub x tx P)
    end.

Definition prop_sub (x: logical_var) (tx: term) (P: prop): prop :=
  naive_sub x tx (rename_all tx P).

Notation "P [ x |-> t ]" := (prop_sub x t ((P)%FOL)) (at level 10, x at next level) : FOL_scope.

Inductive provable: prop -> Prop :=
| PImply_1: forall P Q, provable (P IMPLY (Q IMPLY P))
| PImply_2: forall P Q R, provable
   ((P IMPLY Q IMPLY R) IMPLY
    (P IMPLY Q) IMPLY
    (P IMPLY R))
| Modus_ponens: forall P Q,
    provable (P IMPLY Q) ->
    provable P ->
    provable Q
| PFalse_elim: forall P,
    provable (PFalse IMPLY P)
| Excluded_middle: forall P,
    provable (NOT P OR P)
| PForall_elim: forall x P t,
    provable ((FORALL x, P) IMPLY (P [x |-> t]))
| PForall_intros: forall x P Q,
    prop_free_occur x P = O ->
    provable (P IMPLY Q) ->
    provable (P IMPLY FORALL x, Q)
| PEq_refl: forall t,
    provable (t == t)
| PEq_sub: forall P x t t',
    provable (t == t' IMPLY P[x |-> t] IMPLY P[x |-> t']).

Notation "|--  P" := (provable P) (at level 91, no associativity): FOL_scope.

(** We can formalize its semantics as follows. First, an interpretation is a
domain [D], an interpretation [Rel] of the binary relation symbol [PRel] and
assignments of all logical variables.*)

Inductive Interp: Type :=
| Build_Interp (D: Type) (E : D -> D -> Prop) (Rel: D -> D -> Prop) (La: logical_var -> D) : Interp.

Definition domain_of (J: Interp): Type :=
  match J with
  | Build_Interp D _ _ _ => D
  end.

Definition Equal_of (J: Interp): domain_of J -> domain_of J -> Prop :=
  match J with
  | Build_Interp _ E _ _ => E
  end.

Definition Rel_of (J: Interp): domain_of J -> domain_of J -> Prop :=
  match J as J0 return
    match J0 with
    | Build_Interp D E Rel La => D
    end ->
    match J0 with
    | Build_Interp D E Rel La => D
    end ->
    Prop
  with
  | Build_Interp D E Rel La => Rel
  end.

Definition Lassn_of (J: Interp): logical_var -> domain_of J :=
  match J as J0 return
    logical_var -> 
    match J0 with
    | Build_Interp D E Rel La => D
    end
  with
  | Build_Interp D E Rel La => La
  end.

Definition Lassn_update {D: Type} (La: logical_var -> D) (x: logical_var) (v: D): logical_var -> D :=
  fun y => if (Nat.eq_dec x y) then v else La y.


Definition Interp_Lupdate (J: Interp) (x: logical_var): domain_of J -> Interp :=
  match J with
  | Build_Interp D E Rel La =>
     fun v => Build_Interp D E Rel (Lassn_update La x v)
  end.


Definition term_denote (J: Interp) (t: term): domain_of J :=
    match t with
    | TId x => Lassn_of J x
    end.

Definition term_relation: Type := term -> term -> Prop.

Definition equiv_class_of_elem (R : term_relation) (a : term) : term -> Prop :=
  fun b => R a b.


(** [set_equal s1 s2] : s1 = s2 , which defines the equality of 2 (term-) sets *)
Definition set_equal (s1 s2 : term -> Prop): Prop :=
  forall t, s1 t <-> s2 t.

Fixpoint satisfies (J: Interp) (d: prop): Prop :=
    match d with
    | PEq t1 t2   => Equal_of J (term_denote J t1) (term_denote J t2)
    | PRel t1 t2  => Rel_of J (term_denote J t1) (term_denote J t2)
    | PFalse      => False
    | PImpl P1 P2 => ~ (satisfies J P1) \/ (satisfies J P2)
    | PForall x P => forall v, satisfies (Interp_Lupdate J x v) P
    end.

Notation "J  |==  x" := (satisfies J x) (at level 90, no associativity): FOL_scope.

Local Open Scope FOL_scope.

Definition valid (P: prop): Prop :=
  forall J: Interp, J |== P.

Notation "|==  P" := (valid P) (at level 91, no associativity): FOL_scope.


Definition Lassn_equiv {D : Type} (E : D -> D -> Prop) (La1 La2 : logical_var -> D) :=
  forall x, E (La1 x) (La2 x).

Lemma Interp_Lassn_equiv_spec: forall D E R La1 La2 P,
  (Lassn_equiv E) La1 La2 ->
  Build_Interp D E R La1 |== P <-> Build_Interp D E R La2 |== P.
Admitted.

Lemma Lassn_update_self: forall D E La x (v1 v2 : D),
  (Lassn_equiv E)
  (Lassn_update (Lassn_update La x v1) x v2)
  (Lassn_update La x v2).
Admitted.

Lemma Lassn_update_update_diff: forall D E La x1 x2 (v1 v2 : D),
  x1 <> x2 ->
  (Lassn_equiv E)
  (Lassn_update (Lassn_update La x1 v1) x2 v2)
  (Lassn_update (Lassn_update La x2 v2) x1 v1).
Admitted.

Definition sound: Prop :=
  forall P: prop, |-- P -> |== P.

Definition complete: Prop :=
  forall P: prop, |== P -> |-- P.

Lemma prop_sub_spec: forall J (P: prop) (x: logical_var) (t: term),
  J |== P[ x |-> t] <->
  Interp_Lupdate J x (term_denote J t) |== P.
Admitted.

Lemma no_occ_satisfies: forall J P x v,
  prop_free_occur x P = O ->
  (J |== P <-> Interp_Lupdate J x v |== P).
Admitted.

Definition derive (Gamma: prop -> Prop) (P: prop): Prop :=
  exists l, Forall Gamma l /\ |-- fold_right PImpl P l.

Notation "Gamma  |--  P" := (derive Gamma P) (at level 90, no associativity): FOL_scope.

(** Here, [Forall Gamma l] says that all elements in [l] are elements in
[Gamma]. Here is the definition of [Forall] in Coq standard library.
Intuitively, if propositions [Gamma] derive [P], there is one [Gamma]'s finite
subset, such that the conjunction of this subset implies [P]. *)

(** If [derive] is a generalization of [provable], then [entail] is a
generalization of [valid]. *)

Lemma PImpl_trans_n1: forall P Q l,
  |-- fold_right PImpl P l ->
  |-- P IMPLY Q ->
  |-- fold_right PImpl Q l.
Proof.
  intros.
  induction l as [| R].
  + simpl.
    simpl in H.
    apply Modus_ponens with P; tauto.
  + simpl.
    simpl in H.
    pose proof Modus_ponens _ _ H.
    assert (|-- R -> |-- fold_right PImpl Q l). { tauto. }
Admitted.


Lemma Gamma_derive_1: forall P Q Gamma,
  Gamma |-- P ->
  (|-- P IMPLY Q) ->
  Gamma |-- Q.
Proof.
  intros.
  unfold derive in H.
  destruct H as [l [? ?]].
  unfold derive.
  exists l.
  split; [tauto|].
  apply PImpl_trans_n1 with P; tauto.
Qed.

Lemma Gamma_derive_2: forall P Q R Gamma,
  Gamma |-- P ->
  Gamma |-- Q ->
  (|-- P IMPLY Q IMPLY R) ->
  Gamma |-- R.
Admitted.

Definition entail (Gamma: prop -> Prop) (P: prop): Prop :=
  forall J, (forall Q, Gamma Q -> J |== Q) -> J |== P.

Notation "Gamma  |=  P" := (entail Gamma P) (at level 90, no associativity): FOL_scope.

(** In logic, if a set of propositions [Gamma] entails [P], we say that [P] is
a consequence (语义后承) of [Gamma]. The double turnstile symbol is usually
overloaded in logic text books. Here is its different meaning.

    - [J |== P], in which [J] is an interpretation and [P] is a
      proposition. It says [J] satisfies [P], or [satisfies J P]
      in our Coq definition;

    - [|== P], in which [P] is a proposition. It says that [P] is
      valid. In other words, for any [J], [J |== P];

    - [J |== Gamma], in which [J] is an interpretation and [Gamma]
      is a set of propositions. It says that [J] satisfies every
      proposition in [Gamma];

    - [Gamma |== P], in which [Gamma] is a set of propositions and
      [P] is one single proposition. It says that [P] is a consequence
      of [Gamma].

In this course, we only use [ |== ] for the first two notation definitions but
use [ |= ] for the last one.

After defining [derive] and [entail], we are ready to state the strong
completeness property. *)

(** * Important FOL theorems *)

(** We directly state the following theorems and omit proofs. Interested
students can try proving them as exercises. *)

Lemma IMPLY_refl: forall P, |-- P IMPLY P.
Admitted.

Lemma IMPLY_trans: forall P Q R, |-- P IMPLY Q -> |-- Q IMPLY R -> |-- P IMPLY R.
Admitted.

Lemma IMPLY_swap: forall P Q R, |-- P IMPLY Q IMPLY R -> |-- Q IMPLY P IMPLY R.
Admitted.

Lemma EM_assu: forall P Q, |-- P IMPLY Q -> |-- NOT P IMPLY Q -> |-- Q.
Admitted.

Lemma FORALL_rename: forall P (x y: logical_var),
  prop_free_occur y P = O ->
  |-- (FORALL x, P) IMPLY (FORALL y, P [x |-> y]).
Admitted.

Lemma PEq_trans: forall t1 t2 t3,
  |-- t1 == t2 IMPLY t2 == t3 IMPLY t1 == t3.
Admitted.

Lemma PEq_symm: forall t1 t2,
  |-- t1 == t2 IMPLY t2 == t1.
Admitted.

Lemma derive_assu: forall (Gamma: prop -> Prop) P,
  Gamma P ->
  Gamma |-- P.
Admitted.

(** Gamma is in Gamma' *)
Definition pset_included (Gamma Gamma': prop -> Prop): Prop :=
  forall P, Gamma P -> Gamma' P.

Lemma derive_expand: forall Gamma Gamma' P,
  pset_included Gamma Gamma' ->
  Gamma |-- P ->
  Gamma' |-- P.
Proof.
  unfold derive.
  intros.
  destruct H0 as [l [? ?]].
  exists l.
  induction l.
  + split.
    - apply Forall_nil.
    - tauto.
  + inversion H0; subst.
    split.
    - apply Forall_cons.
      * unfold pset_included in H.
        firstorder.
      * admit.
    - admit.
Admitted.

(** Gamma Union {P}, Q is either in Gamma or equals to P *)
Definition pset_snoc (Gamma: prop -> Prop) (P: prop): prop -> Prop :=
  fun Q => Gamma Q \/ P = Q.

Notation "Gamma ':;' P" := (pset_snoc Gamma P) (at level 81, left associativity): FOL_scope.

Lemma deduction_theorem: forall Gamma P Q,
  Gamma:; P |-- Q <-> Gamma |-- P IMPLY Q.
Admitted.

Lemma derive_modus_ponens: forall Gamma P Q,
  Gamma:; P |-- Q ->
  Gamma |-- P ->
  Gamma |-- Q.
Admitted.

Lemma derive_NOT_NOT: forall Gamma P,
  Gamma |-- P <-> Gamma |-- NOT NOT P.
Admitted.

(** [x] doesn't appear in [Gamma:;Q]  *)
Lemma derive_EXISTS_intros: forall Gamma P Q x,
  (forall R, (Gamma:; Q) R -> prop_free_occur x R = O) ->
  Gamma:; P |-- Q ->
  Gamma:; EXISTS x, P |-- Q.
Admitted.

Lemma PRel_congr: forall Gamma t1 t2 t3 t4,
  Gamma:; t1 == t2:; t3 == t4:; PRel t1 t3 |-- PRel t2 t4.
Admitted.


(** ------------------- A D D E D ---------------------- *)

Lemma contradiction_false: forall P,
  |-- NOT P IMPLY P IMPLY PFalse.
Admitted.

Lemma NOT_FORALL_EXISTS_NOT: forall x Q,
  |-- (NOT (FORALL x, Q)) IMPLY (EXISTS x, NOT Q).
Admitted.

Lemma wrong_premise: forall P Q,
  |-- NOT P IMPLY (P IMPLY Q).
Admitted.

Lemma Gamma_Impl_reduce: forall Gamma P Q R,
  Gamma :; P :; Q |-- R ->
  |-- Q IMPLY P ->
  Gamma :; Q |-- R.
Admitted.

Lemma EXISTS_intro: forall x P n,
  |-- P [x |-> n] IMPLY EXISTS x, P.
Admitted.

Lemma derive_EXISTS_elim: forall Gamma x Q n R,
  (forall P, (Gamma :; EXISTS x, Q) P -> prop_free_occur n P = O) ->
  (Gamma :; EXISTS n, Q [x |-> n]) |-- R ->
  (Gamma :; EXISTS x, Q) |-- R.
Admitted.

(* ################################################################# *)
(** * FOL Completeness: The definition *)

(** This definition of completeness is also called weak completeness. What is strong completeness instead? *)

Definition strongly_complete: Prop :=
  forall Gamma P,
    Gamma |= P -> Gamma |-- P.

(** Obvious, if a logic is strongly complete, it must be complete. To prove
this theorem, we only need to let the proposition set [Gamma] to be empty. In
Coq, an empty set is defined by "no element is in it". *)

Definition Empty_pset: prop -> Prop := fun P => False.

(** It is easy to prove that an empty set derives an assertion [P] if and only
if this assertion [P] is provable. *)

Lemma Empty_derive_spec: forall P, Empty_pset |-- P <-> |-- P.
Proof.
  intros.
  split; intros.
  + destruct H as [l [? ?]].
    inversion H; subst.
    - simpl in H0.
      exact H0.
    - unfold Empty_pset in H1.
      destruct H1.
  + exists nil.
    split.
    - apply Forall_nil.
    - simpl.
      exact H.
Qed.

(** Also, being a consequence of the empty proposition set is equivalent with
being valid. *)

Lemma Empty_entail_spec: forall P, Empty_pset |= P <-> |== P.
Proof.
  intros.
  unfold entail, valid.
  unfold Empty_pset.
  firstorder.
Qed.

(* ################################################################# *)
(** * Proof By Contraposition: Satisfiability and Consistency *)

(** We prove strong completeness by contraposition. In other words, we prove
that, if [P] is not derivable from [Gamma] then [P] is not a consequence of
[Gamma]. The negation of [derive] and [entail] are strongly connected with two
other concepts: consistent and satisfiable. *)

Definition consistent (Gamma: prop -> Prop): Prop :=
  ~ (Gamma |-- PFalse).

(** A proposition set is consistent if we cannot derive false from it. For any
[Gamma] and [P], [Gamma] do not derive [P] if and only if [Gamma] and [NOT P]
are consistent. *)

Lemma not_derive_spec: forall Gamma P,
  ~ (Gamma |-- P) <-> consistent (Gamma:; (NOT P)).
Proof.
  intros.
  unfold consistent.
  rewrite deduction_theorem.
  pose proof derive_NOT_NOT Gamma P.
  unfold PNot.
  unfold PNot in H.
  tauto.
Qed.

(** A proposition set is satisfiable if there is an interpretation that satisfies
all propositions in the set. For any [Gamma] and [P], [P] is not [Gamma]'s
consequence if and only if [Gamma] and [NOT P] are satisfiable. *)

Definition satisfiable (Gamma: prop -> Prop): Prop :=
  exists J, forall P, Gamma P -> J |== P.

Lemma not_entail_spec: forall Gamma P,
  ~ (Gamma |= P) <-> satisfiable (Gamma:; (NOT P)).
Proof.
  intros.
  unfold satisfiable, entail.
  split; intros.
  + apply not_all_ex_not in H.
    destruct H as [J ?].
    assert ((forall Q : prop, Gamma Q -> J |== Q) /\ ~ (J |== P)).
    { tauto. }
    clear H.
    destruct H0.
    exists J.
    unfold pset_snoc.
    intros.
    destruct H1.
    - apply H.
      exact H1.
    - subst P0.
      simpl.
      tauto.
  + unfold not.
    intros.
    destruct H as [J ?].
    specialize (H0 J).
    assert (forall Q : prop, Gamma Q -> J |== Q).
    {
      intros.
      apply H.
      unfold pset_snoc.
      tauto.
    }
    assert (~ (J |== P)).
    {
      assert ((Gamma:; NOT P) (NOT P)).
      { unfold pset_snoc. right. reflexivity. }
      specialize (H _ H2).
      simpl in H.
      tauto.
    }
    tauto.
Qed.

(* ################################################################# *)
(** * Henkin Style Proof and Maximal Consistent Set *)

(** The following part of our proof is of a famous proof style for logic
completeness, the Henkin style proof. It contains two steps: (1) expanding a
consistent set of propositions to a _maximal consistent set_ (MCS); and
(2) constructing an interpretation (usually called _canonical model_)
that satisfies all propositions in the MCS. *)

Definition maximal_consistent (Gamma: prop -> Prop): Prop :=
  consistent Gamma /\
  (forall Gamma', pset_included Gamma Gamma' ->
                  consistent Gamma' ->
                  pset_included Gamma' Gamma).

(** In a simplest Henkin style proof, MCS is enough for canonical model
construction. For first order logics's completeness, we need to use maximal
consistent set with witnesses. *)


Definition witnessed (Gamma: prop -> Prop): Prop :=
  forall (x: logical_var) (P: prop),
    Gamma (EXISTS x, P) ->
    exists (t: term), Gamma (P [ x |-> t ]).

End OneBinRel_FOL.

(* 2019-6-24 10:20:48 *)
