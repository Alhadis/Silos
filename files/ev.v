(****** Preliminary definitions. ******)

Variable Dom : Set.

Definition PFalse (x : Dom) := False.
Definition PTrue (x : Dom) := True.

Inductive Formula : Type :=
  | FPred : (Dom -> Prop) -> Formula
  | FAnd : Formula -> Formula -> Formula
  | FOr: Formula -> Formula -> Formula.

Fixpoint Eval (f : Formula) (x : Dom) {struct f} : Prop :=
    match f with
    | FPred p => p x
    | FAnd fa fb => Eval fa x /\ Eval fb x
    | FOr fa fb => Eval fa x \/ Eval fb x
    end.

Definition Unsat (f : Formula) := forall x : Dom, ~ Eval f x.

Variable eq : forall x y : Formula, {x=y} + {x<>y}.

(****** The (simplified) prunning algorithm. ******)
Fixpoint Prune (old new : Formula) {struct new} : Formula :=
    match old, new with
        | FAnd a b, FAnd a' c => if eq a a' then FAnd a (Prune b c) else new
        | _, FOr a b => FOr (Prune old a) (Prune old b)
        | _, _ => if eq old new then (FPred PFalse) else new
    end.

(****** Correctness of the pruning algorithm. ******)

Lemma PruneInvA : forall old new : Formula, forall x : Dom,
    (~ Eval old x -> Eval new x -> Eval (Prune old new) x).
Proof.
double induction old new.
  intros.
      unfold Prune in |- *.
      induction eq.
    rewrite a in H; contradiction.
    assumption.
  intros.
      unfold Prune in |- *.
      induction eq.
    rewrite a in H1; contradiction.
    assumption.
  intros.
      unfold Prune in |- *; fold Prune in |- *.
      unfold Eval in |- *; fold Eval in |- *.
      unfold Eval in H2; fold Eval in H2.
      intuition.
  intros.
      unfold Prune in |- *.
      induction eq.
    rewrite a in H1; contradiction.
    assumption.
  intuition.
      unfold Prune in |- *; fold Prune in |- *.
      induction eq.
    rewrite a; rewrite a in H2; rewrite a in H3; clear a.
        firstorder.
    assumption.
  intros.
      unfold Prune in |- *; fold Prune in |- *.
      unfold Eval in |- *; fold Eval in |- *.
      unfold Eval in H4; fold Eval in H4.
      intuition.
  intros.
      unfold Prune in |- *.
      induction eq.
    rewrite a in H1; contradiction.
    assumption.
  intros.
      unfold Prune in |- *.
      induction eq.
    rewrite a in H3; contradiction.
    assumption.
  intros.
      unfold Prune in |- *; fold Prune in |- *.
      unfold Eval in |- *; fold Eval in |- *.
      unfold Eval in H4; fold Eval in H4.
      intuition.
Qed.

Lemma PruneInvB : forall old new : Formula, forall x : Dom,
    (~ Eval old x -> Eval (Prune old new) x -> Eval new x).
Proof.
double induction old new.
  unfold Eval in |- *; fold Eval in |- *;
      unfold Prune in |- *; intros; induction eq.
    unfold Eval in H0; contradiction.
    unfold Eval in H0; assumption.
  unfold Eval in |- *; fold Eval in |- *.
      unfold Prune in |- *; fold Prune in |- *.
      intros; induction eq.
    unfold Eval in H2; contradiction.
    unfold Eval in H2; assumption.
  unfold Eval in |- *; fold Eval in |- *.
      unfold Prune in |- *; fold Prune in |- *.
      intros.
      unfold Eval in H2; fold Eval in H2.
      firstorder.
  unfold Eval in |- *; fold Eval in |- *.
      unfold Prune in |- *; fold Prune in |- *.
      intros; induction eq.
    unfold Eval in H2; contradiction.
    unfold Eval in H2; assumption.
  unfold Eval in |- *; fold Eval in |- *.
      unfold Prune in |- *; fold Prune in |- *.
      intros; induction eq.
    unfold Eval in H4; fold Eval in H4.
        rewrite a in H4; rewrite a in H3.
        intuition.
    unfold Eval in H4; fold Eval in H4; assumption.
  intuition.
      unfold Prune in H4; fold Prune in H4; unfold Eval in H4; fold Eval in H4.
      unfold Eval in |- *; fold Eval in |- *.
      case H4.
    intros.
        left.
        firstorder.
    intros.
        right.
        firstorder.
  unfold Eval in |- *; fold Eval in |- *.
      unfold Prune in |- *; fold Prune in |- *.
      intros; induction eq.
    unfold Eval in H2; contradiction.
    unfold Eval in H2; assumption.
  unfold Eval in |- *; fold Eval in |- *.
      unfold Prune in |- *; fold Prune in |- *.
      intros; induction eq.
    unfold Eval in H4; contradiction.
    unfold Eval in H4; assumption.
  unfold Eval in |- *; fold Eval in |- *.
      unfold Prune in |- *; fold Prune in |- *.
      intros.
      unfold Eval in H4; fold Eval in H4.
      case H4.
    intros.
        left.
        firstorder.
    intros; right; firstorder.
Qed.

Lemma UnsatImp : forall a b : Formula,
    (forall x : Dom, Eval a x -> Eval b x) -> Unsat b -> Unsat a.
Proof.
    unfold Unsat.
    firstorder.
Qed.

Lemma PruneComplete : forall old new : Formula,
    Unsat old -> Unsat new -> Unsat (Prune old new).
Proof.
    intros.
    apply (UnsatImp (Prune old new) new).
    unfold Unsat in H.
    intro.
    apply PruneInvB.
    auto.
    assumption.
Qed.

Lemma PruneSound : forall old new : Formula,
    Unsat old -> Unsat (Prune old new) -> Unsat new.
Proof.
    intros.
    apply (UnsatImp new (Prune old new)).
    intro.
    unfold Unsat in H.
    apply PruneInvA.
    auto.
    assumption.
Qed.

Theorem PruneCorrect : forall old new : Formula,
    Unsat old -> (Unsat new <-> Unsat (Prune old new)).
Proof.
    intros.
    split.
    apply PruneComplete; assumption.
    apply PruneSound; assumption.
Qed.

(****** A trivial pruning algorithm and its correctness. ******)
Definition TrivialPrune (old new : Formula) := new.

Theorem TrivialPruneCorrect : forall old new : Formula,
    Unsat old -> (Unsat new <-> Unsat (TrivialPrune old new)).
Proof.
    intuition.
Qed.

(*
 vim:ft=coq:
*)
