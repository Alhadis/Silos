Section ModelTests.

Require Import Syntax.
Require Import Model.
Require Import TechnicalLemmas.

Definition P : formula := Rel_f (Rel 0) nil.
Definition Q : formula := Rel_f (Rel 1) nil.
Definition S : formula := Rel_f (Rel 2) nil.

Definition Tau : term := Var_t (Var 0).
Definition Upsilon : term := Var_t (Var 1).
Definition Chi : term := Var_t (Var 2).
Variable p : term.

Definition xvar:var := Var 0.
Definition x:term := Var_t xvar.

Definition F : term := Fun_t (Fn 0) nil.

Axiom K : focal_model.
Axiom w : W K.
Axiom v : var -> D (s K w).

Axiom d : D (s K w).
Axiom d2 : D (s K w).

Theorem test_true : models K w v FocalTrue.
Proof.
simpl.
trivial.
Qed.

Theorem test_false : ~(models K w v FocalFalse).
Proof.
simpl.
auto.
Qed.

Axiom tau_to_d : (v (Var 0)) = d.
Axiom P_d_true : R (s K w) 0 (d::nil).

Theorem test_rel_f : models K w v (Rel_f (Rel 0) (Tau::nil)).
Proof.
simpl.
rewrite tau_to_d.
apply P_d_true.
Qed.

Theorem test_ed : models K w v (Eq Tau Tau).
Proof.
simpl.
rewrite tau_to_d.
apply equiv_refl.
Qed.

Theorem test_and : models K w v P -> models K w v Q -> models K w v (And P Q).
Proof.
intros.
unfold models.
auto.
Qed.

Theorem test_or : models K w v P -> models K w v (Or P Q).
Proof.
intros.
unfold models.
auto.
Qed.

Axiom from_Q_S : forall (w' : W K) (l : lt K w w'), R (s K w') 1 nil -> R (s K w') 2 nil.

Theorem test_implies : models K w v (Implies Q S).
Proof.
simpl.
apply from_Q_S.
Qed.

Axiom not_P :forall (w' : W K), lt K w w' -> ~(R (s K w') 0 nil).

Theorem test_not : models K w v (Not P).
Proof.
simpl.
apply not_P.
Qed.

Axiom connected_Q : forall (w' : W K) (d : D (s K w')) (l : lt K w w'), (R (s K w') 1 ((subst_map K w' (extend_v K w w' l v) xvar d (Var 0)) :: nil)).

Theorem test_forall : models K w v (Forall xvar (Rel_f (Rel 1) (Tau :: nil))).
Proof.
simpl.
apply connected_Q. 
Qed.

Axiom S_d : R (s K w) 2 (d :: nil).

Theorem test_exists : models K w v (Exists xvar (Rel_f (Rel 2)(Tau :: nil))).
Proof.
simpl.
exists d.
unfold subst_map.
unfold xvar.
induction (var_dec (Var 0) (Var 0)).
apply S_d.
assert (Var 0 = Var 0). trivial.
unfold not in b.
apply b in H.
inversion H.
Qed.


Axiom conn_P : forall (w' : W K) (l : lt K w w') (w'' : W K), A K (coerce_d_to_p K w' (mu K w' (extend_v K w w' l v) (Var_t (Var 0)))) w' w'' -> R (s K w'') 0 nil.

Theorem test_says : models K w v (Says Tau P).
Proof.
simpl.
apply conn_P.
Qed.

Axiom upsilon_d2 : v (Var 1) = d2.

Axiom agreement : forall (w' w'' : W K), restricted_A K (coerce_d_to_p K w d2) w w' w'' -> restricted_A K (coerce_d_to_p K w d) w w' w''.

Theorem test_speaksfor : models K w v (Speaksfor Tau Upsilon).
Proof.
simpl.
rewrite upsilon_d2.
rewrite tau_to_d.
apply agreement.
Qed.

End ModelTests.
