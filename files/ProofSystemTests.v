Section ProofSystemTests.

Require Import Syntax.
Require Import ProofSystem.


(************************************************************************************)
(*                       Formulas to be used in the tests.                          *)
(************************************************************************************)
Definition P : formula := Rel_f (Rel 0) nil.
Definition Q : formula := Rel_f (Rel 1) nil.
Definition R : formula := Rel_f (Rel 2) nil.

(************************************************************************************)
(*                           Terms to be used in the tests.                         *)
(************************************************************************************)
Definition Tau : term := Var_t (Var 0).
Definition Upsilon : term := Var_t (Var 1).
Definition Chi : term := Var_t (Var 2).
Variable p : term.

Definition xvar:var := Var 0.
Definition x:term := Var_t xvar.

Definition F : term := Fun_t (Fn 0) nil.

(************************************************************************************)
(*              Tests for the proves relation of the proof system.                  *)
(************************************************************************************)

(* Test hypothesis. *)
Theorem test_assumption : proves (P::nil) P. 
Proof.
apply hyp.
auto with datatypes.
Qed.

Theorem test_trueI : proves nil FocalTrue.
Proof.
apply trueI.
Qed.

Theorem test_falseE : proves (FocalFalse::nil) P.
Proof.
apply falseE.
auto using hyp with datatypes.
Qed.

Theorem test_andI :
  proves (P::Q::nil) (And P Q).
Proof.
apply andI;
auto using hyp with datatypes.
Qed.

Theorem test_andE1 :
proves (P::Q::nil) P.
Proof.
apply andE1 with (phi := P) (psi := Q).
apply test_andI.
Qed.

Theorem test_andE2 :
proves (P::Q::nil) Q.
Proof.
apply andE2 with (phi := P) (psi := Q).
apply test_andI.
Qed.

Theorem test_orI1 :  proves (P::nil) (Or P Q).
Proof.
apply orI1.
auto using hyp with datatypes.
Qed.

Theorem test_orI2 : proves (Q::nil) (Or P Q).
Proof.
apply orI2; auto using hyp with datatypes.
Qed.


(* This little lemma allows us to apply modus_ponens (impE) even in another order. *)
Lemma modus_ponens_judgement : 
  forall Phi Psi : formula, forall gamma : list formula, 
    proves gamma (Implies Phi Psi) -> proves gamma Phi -> proves gamma Psi.
Proof.
intros.
apply impE with (phi := Phi) (psi := Psi); [assumption | assumption].
Qed.

Theorem test_orE : proves ((Or P Q) :: (Implies P R) :: (Implies Q R) :: nil) R.
Proof.
apply orE with (phi1 := P) (phi2 := Q);
[ apply hyp; auto using hyp with datatypes
| apply modus_ponens_judgement with (Phi := P) (Psi := R) 
| apply modus_ponens_judgement with (Phi := Q) (Psi := R) ];
auto using hyp with datatypes.
Qed.

Theorem test_impI : proves (P :: nil) Q -> proves nil (Implies P Q).
apply impI.
Qed.

Theorem test_impE : proves nil P -> proves nil (Implies P Q) -> proves nil Q.
apply impE with (phi := P).
Qed.

Theorem test_forallI : proves nil (Eq x x) -> proves nil (Forall xvar (Eq x x)).
intros.
apply forallI.
assumption.
simpl.
unfold is_true; auto.
Qed.

Theorem test_forallE : proves nil (Forall xvar (Eq x x)) -> proves nil (subst xvar x (Eq x x)).
apply forallE.
Qed.

Theorem test_existsI : proves nil (subst xvar x (Eq x x)) -> proves nil (Exists xvar (Eq x x)).
apply existsI with (tau := x).
Qed.

Theorem test_existsE : proves nil (Exists xvar P) -> proves (P::nil) (Eq x x) -> proves nil (Eq x x).
Proof.
intros.
apply existsE with (phi := P) (x := xvar);
[assumption
|assumption
|simpl; auto].
unfold is_true; auto.
Qed.

Theorem test_saysILR : proves nil P -> proves (relativize p nil) (Says p P).
apply saysILR.
Qed.

Theorem test_saysIR : proves (relativize p nil) P -> proves (relativize p nil) (Says p P).
Proof.
apply saysIR.
Qed.

Theorem test_saysIL : proves nil (Says p P) -> proves (relativize p nil) (Says p P).
Proof.
apply saysIL.
Qed.

Theorem test_eqRefl : proves nil (Eq Tau Tau).
Proof.
apply eqRefl.
Qed.

Theorem test_eqSymm : proves nil (Eq Tau Upsilon) -> proves nil (Eq Upsilon Tau).
Proof.
apply eqSymm.
Qed.

Theorem test_eqTrans : proves nil (Eq Tau Upsilon) -> proves nil (Eq Upsilon Chi) -> proves nil (Eq Tau Chi).
Proof.
apply eqTrans.
Qed.

(* TODO: need a test for eqIndF and eqIndR *)

Theorem test_handOff : proves nil (Says Upsilon (Speaksfor Tau Upsilon)) -> proves nil (Speaksfor Tau Upsilon).
Proof.
apply handOff.
Qed.

Theorem test_speaksSays : proves nil (Speaksfor Tau Upsilon) -> proves nil (Says Tau P) -> proves nil (Says Upsilon P).
Proof.
apply speaksSays.
Qed.

Theorem test_speaksForRefl : proves nil (Speaksfor Tau Tau).
Proof.
apply speaksForRefl.
Qed.

Theorem test_speaksForTrans : proves nil (Speaksfor Tau Upsilon) -> proves nil (Speaksfor Upsilon Chi) -> proves nil (Speaksfor Tau Chi).
Proof.
apply speaksForTrans.
Qed.

End ProofSystemTests.
