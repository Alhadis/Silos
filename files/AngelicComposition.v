Require Import Statement.

Definition fn { T U V : Type } (P : @Specification T U) (Q : @Specification U V) : @Specification T V :=
  fun s s' => exists sx, P s sx /\ Q sx s'.

Notation "P ⊡ Q" := (fn P Q) (at level 80, right associativity, format "P ⊡ Q").

Theorem id_left_neutral : forall { T U: Type } (P : @Specification T U) s s', ((fun s s' => s = s') ⊡ P) s s' <-> P s s'.
Proof. firstorder. subst x; auto. Qed.

Theorem id_right_neutral : forall { T U : Type } (P : @Specification T U) s s', (P ⊡ (fun s s' => s = s')) s s' <-> P s s'.
Proof. firstorder. subst x; auto. Qed.

Theorem assoc : forall { T U V W : Type } (P : @Specification T U) (Q : @Specification U V) (R : @Specification V W) s s',
    (P ⊡ Q ⊡ R) s s' <-> ((P ⊡ Q) ⊡ R) s s'.
Proof. firstorder. Qed.

Theorem rdistr_or : forall {T U V} (P : @Specification T U) (Q : @Specification U V) (R : @Specification U V),
    forall s s', (P ⊡ (fun s s' => Q s s' \/ R s s')) s s' <-> (P ⊡ Q) s s' \/ (P ⊡ R) s s'.
Proof. firstorder. Qed.

Theorem ldistr_or : forall {T U V} (P : @Specification T U) (Q : @Specification T U) (R : @Specification U V),
    forall s s', ((fun s s' => P s s' \/ Q s s') ⊡ R) s s' <-> (P ⊡ R) s s' \/ (Q ⊡ R) s s'.
Proof. firstorder. Qed.

Theorem rdistr_and : forall {T U V} (P : @Specification T U) (Q : @Specification U V) (R : @Specification U V),
    forall s s', (P ⊡ (fun s s' => Q s s' /\ R s s')) s s' -> (P ⊡ Q) s s' /\ (P ⊡ R) s s'.
Proof. firstorder. Qed.

Theorem ldistr_and : forall {T U V} (P : @Specification T U) (Q : @Specification T U) (R : @Specification U V),
    forall s s', ((fun s s' => P s s' /\ Q s s') ⊡ R) s s' -> (P ⊡ R) s s' /\ (Q ⊡ R) s s'.
Proof. firstorder. Qed.

Theorem rneutral_eq : forall T U (P : T >> U), forall s s', P s s' <-> (P ⊡ eq) s s'.
Proof.
  intros *.
  split.
  { firstorder. }
  { intros (sx,(HHp,HH)); subst. auto. }
Qed.

Theorem lneutral_eq : forall T U (P : T >> U), forall s s', P s s' <-> (eq ⊡ P) s s'.
Proof.
  intros *.
  split.
  { firstorder. }
  { intros (sx,(HH,HHp)); subst. auto. }
Qed.
