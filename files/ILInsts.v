Require Import RelationClasses Setoid Morphisms.
Require Import ILogic ILTac.

Set Implicit Arguments.
Unset Strict Implicit.
Set Maximal Implicit Insertion.

Section ILogic_Pre.
  Context T (ord: relation T).
  Context {A : Type} `{IL: ILogic A}.

  Record ILPreFrm := mkILPreFrm {
    ILPreFrm_pred :> T -> A;
    ILPreFrm_closed: forall t t': T, ord t t' ->
      ILPreFrm_pred t |-- ILPreFrm_pred t'
  }.

  Notation "'mk'" := @mkILPreFrm.

  Global Instance ILPreFrm_m (P: ILPreFrm): Proper (ord ++> lentails) P.
  Proof.
    intros t t' Ht. apply ILPreFrm_closed; assumption.
  Qed.

  Local Obligation Tactic :=
    repeat match goal with
    | |- ord _ _ -> _ => intros Hord; try setoid_rewrite Hord; reflexivity
    | |- _ => intro
    end.

  Program Definition ILPre_Ops : ILogicOps ILPreFrm := {|
    lentails P Q := PreOrder ord -> forall t:T, P t |-- Q t;
    ltrue        := mk (fun t => ltrue) _;
    lfalse       := mk (fun t => lfalse) _;
    limpl    P Q := mk (fun t => PreOrder ord ->> Forall t', ord t t' ->> P t' -->> Q t') _;
    land     P Q := mk (fun t => P t //\\ Q t) _;
    lor      P Q := mk (fun t => P t \\// Q t) _;
    lforall  A P := mk (fun t => Forall a, P a t) _;
    lexists  A P := mk (fun t => Exists a, P a t) _
  |}.
  Next Obligation.
    lpropimplR HPre; lpropimplL; [assumption|].
    lforallR; intro t''; lforallL t''.
    lpropimplR Ht''; lpropimplL. etransitivity; eassumption.
    reflexivity.
  Qed.

  Local Existing Instance ILPre_Ops.

  Program Definition ILPre_ILogic : ILogic ILPreFrm.
  Proof.
    split; unfold lentails; simpl; intros.
    - split; red; [reflexivity|].
      intros P Q R HPQ HQR HPre t. 
      specialize (HPQ HPre); specialize (HQR HPre).
      transitivity (Q t); [apply HPQ | apply HQR].
    - apply ltrueR.
    - apply lfalseL.
    - lforallL x; apply H. assumption.
    - lforallR; intros; apply H. assumption.
    - lexistsL; intros; apply H. assumption.
    - lexistsR x; apply H. assumption.
    - apply landL1; eapply H; assumption.
    - apply landL2; eapply H; assumption.
    - apply lorR1; eapply H; assumption.
    - apply lorR2; eapply H; assumption.
    - apply landR; [eapply H | eapply H0]; assumption.
    - apply lorL; [eapply H | eapply H0]; assumption.
    - apply landAdj.
      etransitivity; [apply H|]. assumption. clear H. lpropimplL. assumption. apply lforallL with t.
      apply lpropimplL; reflexivity.
    - lpropimplR H1. apply lforallR; intro t'. apply lpropimplR; intro Hord. apply limplAdj.
      rewrite ->Hord; eapply H; assumption.
  Qed.

  Global Instance ILPreFrm_pred_m {H : PreOrder ord}:
    Proper (lentails ++> ord ++> lentails) ILPreFrm_pred.
  Proof.
    intros P P' HPt t t' Ht. rewrite ->Ht. apply HPt. assumption.
  Qed.

  Global Instance ILPreFrm_pred_equiv_m:
    Equivalence ord ->
    Proper (lequiv ++> ord ++> lequiv) ILPreFrm_pred.
  Proof.
    intros Hord P P' HPt t t' Ht. split.
    - rewrite ->Ht. apply HPt. firstorder.
    - symmetry in Ht. rewrite <-Ht. apply HPt. firstorder.
  Qed.

  Program Definition ILPreAtom {HPre : PreOrder ord} (t: T) :=
    mk (fun t' => ord t t' /\\ ltrue) _.

End ILogic_Pre.

Implicit Arguments ILPreFrm [[T] [ILOps]].
Implicit Arguments mkILPreFrm [[T] [ord] [A] [ILOps]].

(** If [Frm] is a ILogic, then the function space [T -> Frm] is also an ilogic,
    for any type [T]. All connectives are just pointwise liftings. *)

Section ILogic_Fun.
  Context (T: Type).
  Context {A : Type} `{IL: ILogic A}.

  Program Definition ILFun_Ops : ILogicOps (T -> A) := {|
    lentails P Q := forall t:T, P t |-- Q t;
    ltrue        := fun t => ltrue;
    lfalse       := fun t => lfalse;
    limpl    P Q := fun t => P t -->> Q t;
    land     P Q := fun t => P t //\\ Q t;
    lor      P Q := fun t => P t \\// Q t;
    lforall  A P := fun t => Forall a, P a t;
    lexists  A P := fun t => Exists a, P a t
  |}.
  
  Local Existing Instance ILFun_Ops.

  Program Definition ILFun_ILogic : ILogic (T -> A). 
  Proof.
    split; unfold lentails; simpl; intros.
    - split; red; [reflexivity|].
      intros P Q R HPQ HQR t. transitivity (Q t); [apply HPQ | apply HQR].
    - apply ltrueR.
    - apply lfalseL.
    - apply lforallL with x; apply H.
    - apply lforallR; intros; apply H.
    - apply lexistsL; intros; apply H.
    - apply lexistsR with x; apply H.
    - apply landL1; intuition.
    - apply landL2; intuition.
    - apply lorR1; intuition.
    - apply lorR2; intuition.
    - apply landR; intuition.
    - apply lorL; intuition.
    - apply landAdj; intuition.
    - apply limplAdj; intuition.
  Qed.

End ILogic_Fun.

Global Opaque ILPre_Ops.
Global Opaque ILFun_Ops.
