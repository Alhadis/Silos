Require Import Setoid Morphisms RelationClasses Program.Basics Omega.
Require Import Equiv.

Set Implicit Arguments.
Unset Strict Implicit.
Set Maximal Implicit Insertion.

Section SepAlgSect.
  Class SepAlgOps T:= {
    sa_unit : T;
    sa_mul : T -> T -> T -> Prop
  }.

  Class SepAlg T `{e : Equiv T} `{SAOps: SepAlgOps T} : Type := {
    sa_type            :> Equivalence equiv;
    sa_mon a b c d     : a === b -> sa_mul a c d -> sa_mul b c d;
    sa_mul_eq a b c d  : sa_mul a b c -> sa_mul a b d -> c === d;
    sa_mulC a b c      : sa_mul a b c -> sa_mul b a c;
    sa_mulA a b c      : forall ab abc, sa_mul a b ab -> sa_mul ab c abc ->
                                        exists bc, sa_mul b c bc /\ sa_mul a bc abc;
    sa_unitI a         : sa_mul a sa_unit a
  }.

End SepAlgSect.

Implicit Arguments SepAlg [[e] [SAOps]].

Section SepAlgCompat.
  Context A `{SA: SepAlg A}.

  Definition compat (a b : A) := exists s, sa_mul a b s.
  Definition subheap (a b : A) := exists c, sa_mul a c b.

  Lemma sa_unit_eq a b (H : sa_mul a sa_unit b) : a === b.
  Proof.
    eapply sa_mul_eq; [apply sa_unitI| assumption].
  Qed.

  Lemma sa_monR (a b c d : A) (Habc : sa_mul a b c) (Hcd: c === d) : sa_mul a b d.
  Proof.
    assert (sa_mul c sa_unit d) by (eapply sa_mon; [symmetry; eassumption | apply sa_unitI]).
    pose @sa_mulA as H1; specialize H1.
    specialize (H1 _ _ _ _ _ _ _ _ _ Habc H).
    destruct H1 as [ac [H1 H2]].
    apply sa_unit_eq in H1.
    apply sa_mulC. eapply sa_mon; [symmetry | eapply sa_mulC]; eassumption.
  Qed.
  
  Lemma sa_mulC2 a b c : sa_mul a b c <-> sa_mul b a c.
  Proof.
    split; apply sa_mulC.
  Qed.

End SepAlgCompat.

Module SepAlgNotations.
Notation "a '·' b" := (sa_mul a b) (at level 50, left associativity) : sa_scope.
Notation "a '·' b |-> c" := (sa_mul a b c) (at level 52, no associativity) : sa_scope.
Notation "^" := sa_unit : sa_scope.
Notation "a # b" := (compat a b) (at level 70, no associativity) : sa_scope.
Notation "a <= b" := (subheap a b) (at level 70, no associativity) : sa_scope.
End SepAlgNotations.

Instance sa_mul_equiv_proper T `{SAP : SepAlg T} :
  Proper (equiv ==> equiv ==> equiv ==> iff) sa_mul.
Proof.
  intros x y Heqxy t u Heqtu s v Heqsv; subst;
  split; intros H;
  (eapply sa_mon; [ first [eassumption | symmetry; eassumption]|]);
  apply sa_mulC;
  (eapply sa_mon; [ first [eassumption | symmetry; eassumption]|]);
  apply sa_mulC;
  (eapply sa_monR; [ first [eassumption | symmetry; eassumption]|]).
  assumption. symmetry; assumption.
Qed.

Import SepAlgNotations.

Delimit Scope sa_scope with sa.

Instance subheap_preo A `{sa : SepAlg A} : PreOrder (@subheap A SAOps).
Proof. 
  split.
  + intros a; eexists; apply sa_unitI.
  + intros s0 s1 s2 H1 H2.
    assert (s1 === s1) as H4 by reflexivity.
    destruct H1 as [s10 H1].
    destruct H2 as [s21 H2].
    pose proof (@sa_mulA).
    specialize (H _ _ _ _ _ _ _ _ _ H1 H2).
    destruct H as [s4 [HEqs2 HEqs3]].
    exists s4. assumption.
Qed.

Instance compat_symm Σ `{sa : SepAlg Σ} : Symmetric (compat (A := Σ)).
Proof.
  intros s s0 [s1 Hs]; exists s1; apply sa_mulC; assumption.
Qed.

Section Properties.
  Context Σ `{sa : SepAlg Σ}.
  Open Scope sa_scope.

  Global Instance sa_subheap_equiv_proper :
    Proper (equiv ==> equiv ==> iff) (subheap (A := Σ)).
  Proof.
    intros x y Heqxy t u Heqtu; split; intros [c H]; exists c;
    [rewrite <- Heqxy; rewrite <- Heqtu | rewrite  Heqxy; rewrite Heqtu]; assumption.
  Qed.

  Global Instance sa_compat_equiv_proper :
    Proper (equiv ==> equiv ==> iff) (compat (A := Σ)).
  Proof.
    intros x y Heqxy t u Heqtu; split; [intros [s Heqxst] | intros [s Heqysu]]; exists s.
    + rewrite <- Heqxy, <- Heqtu; assumption.
    + rewrite Heqxy, Heqtu; assumption.
  Qed.

  Lemma compat_subheap {r t : Σ} (s : Σ) (Hsr: r <= s) (Hst: s # t) : r # t.
  Proof.
    destruct Hsr as [sr Hsr]; destruct Hst as [st Hst].
    apply sa_mulC in Hsr.
    pose proof @sa_mulA.
    specialize (H _ _ _ _ _ _ _ _ _ Hsr Hst).
    destruct H as [u [Hst2 Hu]].
    exists u. assumption.
  Qed.

  Lemma subheapT (a b c : Σ) (Hab: a <= b) (Hbc: b <= c) : a <= c.
  Proof.
    unfold subheap in *.
    destruct Hab as [f Hadb].
    destruct Hbc as [g Hbfc].
    destruct (sa_mulA Hadb Hbfc) as [ac [_ H]].
    exists ac. apply H.
  Qed.

  Close Scope sa_scope.

End Properties.

Implicit Arguments subheap [[A] [SAOps]].
Implicit Arguments subheapT [[Σ] [e] [SAOps] [b]].
Implicit Arguments compat_subheap [[Σ] [e] [sa] [r] [t] [SAOps]].

Section SAProd.
  Context A B `{HA: SepAlg A} `{HB: SepAlg B}.

  Global Instance SepAlgOps_prod: SepAlgOps (A * B) := {|
    sa_unit := (sa_unit, sa_unit);
    sa_mul a b c :=
      sa_mul (fst a) (fst b) (fst c) /\
      sa_mul (snd a) (snd b) (snd c)
   |}.

  Global Instance SepAlg_prod: SepAlg (A*B).
  Proof.
    split.
    - apply _.
    - intros * [Hab Hab']. simpl. rewrite Hab, Hab'. auto.
    - intros * [Habc Habc'] [Habd Habd']. split; eapply sa_mul_eq; eassumption.
    - intros * [Habc Habc']. split; eapply sa_mulC; assumption.
    - intros * [Habc Habc'] [Hbc Hbc'].
      destruct (sa_mulA Habc Hbc) as [exA []].
      destruct (sa_mulA Habc' Hbc') as [exB []].
      exists (exA, exB). split; split; assumption.
    - intros *. split; apply sa_unitI.
  Qed.

  Global Instance pair_equiv: Proper (equiv ==> equiv ==> equiv) pair.
  Proof.
    intros a a' Ha b b' Hb. split; simpl; assumption.
  Qed.
End SAProd.

